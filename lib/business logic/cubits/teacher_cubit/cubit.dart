
// ignore_for_file: unnecessary_import, avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
class AppTeacherWebCubit extends Cubit<AppTeacherWebStates>
{
  AppTeacherWebCubit():super(AppTeacherWebInitialState());


  static AppTeacherWebCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AppTeacherWebChangePasswordVisibilityState());
  }

  bool confirmIsPassword = true;
  IconData suffixConfirm = Icons.visibility_outlined;
  void changeConfirmPasswordVisibility()
  {
    confirmIsPassword= !confirmIsPassword;
    suffixConfirm = confirmIsPassword? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(AppTeacherWebChangeConfirmPasswordVisibilityState());
  }

  String value='7th';
  String changeClass(value){
   this.value=value;
   print(value);
   emit(AppTeacherWebChangeClassState());
   return value;

  }

}
