// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/data/models/certificate_model.dart';
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

import '../../../data/models/activate_user_model.dart';
import '../../../data/models/show_staff.dart';
import '../../../presentation/components and constants/constants.dart';
import '../../../presentation/screens/choose_grade_add_table.dart';
import '../../../presentation/screens/choose_grade_show_table.dart';
import '../../../presentation/screens/show_staff.dart';


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
  ChooseGradeShowTableScreen(),
  ChooseGradeAddTableScreen(),
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

  String activeValue='true';
  String changeActive(value) {
    this.activeValue = value;
   // print(activeValue);
   // print(value);
    emit(AppStaffWebChangeActiveState());
    return value;
  }


  ShowStaffModel? showStaffModel;
  Future<ShowStaffModel?> showStaff({activeValue})async
  {
    emit(AppStaffWebStaffShowLoadingState());
    var headers = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/view_staff'));
    request.fields.addAll({
      'is_active': active
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      print(response.statusCode);
    showStaffModel=ShowStaffModel.fromJson(jsonDecode(await response.stream.bytesToString()));
    // print(await response.stream.bytesToString());
     print(showStaffModel?.message);
      emit(AppStaffWebStaffShowSuccessState(showStaffModel!));
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      print(jsonDecode(await response.stream.bytesToString())['message']);
      emit(AppStaffWebStaffShowErrorState());
    }
    return showStaffModel;
  }
  ActivateUserModel? activateUserModel;
  activeUser({required String type, required int id})async
  {
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/activate_user'));
    request.fields.addAll({
      'type': type,
      'id': id.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      activateUserModel=ActivateUserModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(activateUserModel?.toJson().toString());
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];

    }

  }



}
