// ignore_for_file: unnecessary_import, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:web_schoolapp/data/models/teacherRegisterModel.dart';
import 'package:web_schoolapp/data/models/teacher_profile_model.dart';
import '../../../data/models/teacher_show_model.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart'as http;

class AppTeacherWebCubit extends Cubit<AppTeacherWebStates> {
  AppTeacherWebCubit() : super(AppTeacherWebInitialState());

  static AppTeacherWebCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppTeacherWebChangePasswordVisibilityState());
  }

  bool confirmIsPassword = true;
  IconData suffixConfirm = Icons.visibility_outlined;

  void changeConfirmPasswordVisibility() {
    confirmIsPassword = !confirmIsPassword;
    suffixConfirm = confirmIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(AppTeacherWebChangeConfirmPasswordVisibilityState());
  }

  String value = '7th';

  String changeClass(value) {
    this.value = value;
    print(value);
    emit(AppTeacherWebChangeClassState());
    return value;
  }

  String genderValue = 'male';

  String changeGender(value) {
    this.genderValue = value;
    print(value);
    emit(AppTeacherWebChangeGenderState());
    return value;
  }
  RegisterModel? teacherRegisterModel;
  postTeacher({
   required RegisterModelTeacher data
     })async
{
emit(AppTeacherRegisterLoadingState());
var request = http.post( Uri.parse('https://new-school-management-system.onrender.com/teacher_register'),
   headers:{
  'Content-Type': 'application/json',
  'Accept': '*/*',
  'Authorization': 'Bearer $token'
     },
    body: jsonEncode(data.toJson(data))
);



var response = await request;

if (response.statusCode == 201) {
  print(response.statusCode);
  teacherRegisterModel=RegisterModel.fromJson(jsonDecode(await response.body));
  print(teacherRegisterModel?.message);
  print(await response.body);
  emit(AppTeacherRegisterSuccessState(teacherRegisterModel!));
}
else {
  print(response.statusCode);
  print(response.body);
 // print(jsonDecode(await response.body)['message']);
  emit(AppTeacherRegisterErrorState(error: jsonDecode(await response.body)['message']));
}

}

  final List<Teachers> _allTeacher = [
    Teachers(id: 1,fullName: 'Fatima Alkhlif'),
    Teachers(id: 2,fullName: 'Sama Tunsi'),
    Teachers(id: 3,fullName: 'Nour Ghanem'),
    Teachers(id: 4,fullName: 'Abeer Barakat'),
    Teachers(id: 5,fullName: 'Yumna Hashem'),
    Teachers(id: 6,fullName: 'Leen yusef'),
    Teachers(id: 7,fullName: 'Raneem AlAmeen'),
  ];
  List<Teachers> foundUsers = [];

  void getList() {
    foundUsers = _allTeacher;
    emit(AppAllTeacherState());
  }

  void runFilter(Teachers teacher) {
    List<Teachers> results = [];
    if (teacher.fullName!.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      getList();
    } else {
      results = _allTeacher
          .where((user) =>

          user.fullName!.toLowerCase().contains(teacher.fullName!.toLowerCase()))
          .toList();
      foundUsers = results;
      emit(AppSearchFilterNameTeacherState());
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  TeacherProfileModel? teacherProfileModel;
  Future<TeacherProfileModel?> showTeacherProfile({required String id})async
  {
    emit(AppTeacherProfileLoadingState());
    var headers = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('GET', Uri.parse('https://new-school-management-system.onrender.com/web/teacher_profile/$id'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 201) {
      print(response.statusCode);
      teacherProfileModel=TeacherProfileModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(teacherProfileModel?.message);
      print(teacherProfileModel?.firstName);
      emit(AppTeacherProfileSuccessState(teacherProfileModel!));
  }
  else {
      print(response.reasonPhrase);
      print(response.statusCode);
      emit(AppTeacherProfileErrorState(jsonDecode(await response.stream.bytesToString())['message']));
  }
                  return teacherProfileModel;
  }

}
