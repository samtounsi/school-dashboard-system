
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/states.dart';

class AppLoginCubit extends Cubit<AppLoginStates>
{
  AppLoginCubit():super(AppLoginInitialState());

  static AppLoginCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AppLoginChangePasswordVisibilityState());
  }
}