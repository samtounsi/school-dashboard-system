import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/states.dart';

import '../../../data/models/login_model.dart';
import 'package:http/http.dart' as http;

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppLoginChangePasswordVisibilityState());
  }

  LoginModel? loginModel;

  void Login({required userName, required password}) async {
    emit(AppLoginLoadingState());
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/web/login'));
    request.fields.addAll({'username': userName, 'password': password});

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(userName);
      print(password);
      loginModel = LoginModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      //await Future.delayed(const Duration(milliseconds: 1000));
      emit(AppLoginSuccessState(loginModel!));
      // print(loginModel?.token);
    } else {
      emit(AppLoginErrorState(
          error: jsonDecode(await response.stream.bytesToString())['message']
              .toString()));
    }
  }
}
