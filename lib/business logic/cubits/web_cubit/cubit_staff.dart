// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/screens/add_event.dart';
import 'package:web_schoolapp/presentation/screens/add_student.dart';
import 'package:web_schoolapp/presentation/screens/add_teacher.dart';
import 'package:web_schoolapp/presentation/screens/choose_grade.dart';
import 'package:web_schoolapp/presentation/screens/feedBack.dart';
import 'package:web_schoolapp/presentation/screens/home_screen.dart';
import 'package:web_schoolapp/presentation/screens/searchFilter.dart';
import 'package:web_schoolapp/presentation/screens/show_teachers.dart';
import 'package:web_schoolapp/presentation/screens/showtimetable.dart';
import 'package:web_schoolapp/presentation/screens/staff_profile.dart';
import 'package:web_schoolapp/presentation/screens/time_table.dart';
import 'package:http/http.dart'as http;

import '../../../data/models/staff_profile_model.dart';
import '../../../presentation/components and constants/constants.dart';


class WebStaffCubit extends Cubit<WebStaffStates> {
  WebStaffCubit() : super(WebStaffInitState());

  static WebStaffCubit get(context) => BlocProvider.of(context);

  bool isExpanded = false;
  IconData arrow = Icons.arrow_back_ios;
  void ShowHideRail() {
    emit(WebStaffRailAppearState());
    isExpanded = !isExpanded;
    arrow = isExpanded ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
  }

  List<Widget> screens = [
    HomeScreen(),
    SearchStudent(),
    AddStudent(),
    TeachersDisplay(),
    AddTeacher(),
    ChooseGradeScreen(),
    ShowTimetable(),
    Timetable(),
    AddEvent(),
    FeedBack(),
  ];

  int currentInd = 0;
  void ChangeScreen(int index) {
    emit(WebStaffRailAppearState());
    currentInd = index;
  }

  List<NavigationRailDestination> dashBoardElements = [
    NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
    NavigationRailDestination(
        icon: Icon(Icons.tag_faces_rounded), label: Text('Show Students')),
    NavigationRailDestination(
        icon: Icon(Icons.add_reaction), label: Text('Add Student')),
    NavigationRailDestination(
        icon: Icon(Icons.person_4), label: Text('Show Teachers')),
    NavigationRailDestination(
        icon: Icon(Icons.person_add_alt_sharp), label: Text('Add Teacher')),
    NavigationRailDestination(
        icon: Icon(Icons.offline_pin_rounded),
        label: Text('Attendance Monitoring')),
    NavigationRailDestination(
        icon: Icon(Icons.list_alt_rounded), label: Text('Show Timetables')),
    NavigationRailDestination(
        icon: Icon(Icons.post_add_rounded), label: Text('Add Timetables')),
    NavigationRailDestination(
        icon: Icon(Icons.notifications), label: Text('Events')),
    NavigationRailDestination(
        icon: Icon(Icons.feedback), label: Text('Feedback')),
  ];

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;


  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppStaffWebChangePasswordVisibilityState());
  }



}
