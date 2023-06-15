// ignore_for_file: unnecessary_import, avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';

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

  final List<Map<String, dynamic>> _allTeacher = [
    //List from back Api for all students and i will work filter search
    {
      "name": "Andy Ali",
    },
    {
      "name": "Sandy Ahmad",
    },
    {
      "name": "sara Alo",
    },
    {
      "name": "Alia An",
    },
    {
      "name": "Abeer Barakat",
    },
    {
      "name": "Yumna Hashem",
    },
    {
      "name": "Fatima Alkalif",
    },
    {
      "name": "Sama Tounsi",
    },
    {
      "name": "Nour Ghanem",
    },
    {
      "name": "lara fa ",
    },
    {
      "name": "Razan",
    },
    {
      "name": "iman",
    },
    {
      "name": "alaa",
    },
    {
      "name": "hassan",
    },
    {"name": "mona"},
    {
      "name": "raneem",
    },
    {
      "name": "ahmad",
    },
    {
      "name": "ola",
    },
    {
      "name": "maria",
    },
    {
      "name": "ghader",
    },
    {
      "name": "doha",
    },
    {
      "name": "ghofran",
    },
  ];
  List<Map<String, dynamic>> foundUsers = [];

  void getList() {
    foundUsers = _allTeacher;
    emit(AppAllTeacherState());
  }

  void runFilter(String nameValue) {
    List<Map<String, dynamic>> results = [];
    if (nameValue.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      getList();
    } else {
      results = _allTeacher
          .where((user) =>

          user["name"].toLowerCase().contains(nameValue.toLowerCase()))
          .toList();
      foundUsers = results;
      emit(AppSearchFilterNameTeacherState());
      // we use the toLowerCase() method to make it case-insensitive
    }
  }
}
