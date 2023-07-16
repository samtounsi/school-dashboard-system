// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_admin.dart';
import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:web_schoolapp/data/models/staffRegisterModel.dart';
import 'package:web_schoolapp/presentation/screens/add_event.dart';
import 'package:web_schoolapp/presentation/screens/add_staff.dart';
import 'package:web_schoolapp/presentation/screens/add_student.dart';
import 'package:web_schoolapp/presentation/screens/add_teacher.dart';
import 'package:web_schoolapp/presentation/screens/feedBack.dart';
import 'package:web_schoolapp/presentation/screens/home_screen.dart';
import 'package:web_schoolapp/presentation/screens/search_student_screen.dart';
import 'package:web_schoolapp/presentation/screens/section_sort.dart';
import 'package:web_schoolapp/presentation/screens/show_staff.dart';
import 'package:web_schoolapp/presentation/screens/show_teachers.dart';
import 'package:web_schoolapp/presentation/screens/showtimetable.dart';
import 'package:web_schoolapp/presentation/screens/time_table.dart';
import 'package:http/http.dart'as http;

import '../../../presentation/components and constants/constants.dart';

class WebSchoolCubit extends Cubit<WebSchoolStates> {
  WebSchoolCubit() : super(WebSchoolInitState());

  static WebSchoolCubit get(context) => BlocProvider.of(context);

  bool isExpanded = false;
  IconData arrow = Icons.arrow_back_ios;
  void ShowHideRail() {
    emit(WebSchoolRailAppearState());
    isExpanded = !isExpanded;
    arrow = isExpanded ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
  }

  List<Widget> screens = [
    HomeScreen(),
    SearchStudent(),
    AddStudent(),
    TeachersDisplay(),
    AddTeacher(),
    ShowStaff(),
    AddStaff(),
    SectionSort(),
    ShowTimetable(),
    Timetable(),
    AddEvent(),
    FeedBack(),
  ];

  int currentInd = 0;
  void ChangeScreen(int index) {
    emit(WebSchoolRailAppearState());
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
        icon: Icon(Icons.admin_panel_settings), label: Text('Show Staff')),
    NavigationRailDestination(
        icon: Icon(Icons.add_moderator), label: Text('Add Staff')),
    NavigationRailDestination(
        icon: Icon(Icons.people_alt_sharp), label: Text('Distribute Students')),
    NavigationRailDestination(
        icon: Icon(Icons.list_alt_rounded), label: Text('Show Timetables')),
    NavigationRailDestination(
        icon: Icon(Icons.post_add_rounded), label: Text('Add Timetables')),
    NavigationRailDestination(
        icon: Icon(Icons.notifications), label: Text('Events')),
    NavigationRailDestination(
        icon: Icon(Icons.feedback), label: Text('Feedback')),
  ];

  String staffGenderValue = 'male';

  String changeStaffGender(value) {
    this.staffGenderValue = value;
    print(value);
    emit(AppStaffWebChangeGenderState());
    return value;
  }



  RegisterModel? staffRegisterModel;
  postStaff
  ({
    required StaffModel data
   })async
  {
  emit(WebSchoolAddStaffLoadingState());


   var request = http.post(Uri.parse('https://new-school-management-system.onrender.com/web/admin_register')
   ,headers: {
         'Content-Type': 'application/json',
         'Accept': '*/*',
         'Authorization': 'Bearer $token'
       },
     body: jsonEncode(data.toJson(data))
   );

   var response = await request;

    if (response.statusCode == 201) {
      print(response.statusCode);
      staffRegisterModel=RegisterModel.fromJson(jsonDecode(await response.body));
     print(staffRegisterModel?.message);
      //print(await response.stream.bytesToString());
     emit(WebSchoolAddStaffSuccessState(staffRegisterModel!));
    }
    else
    {
      print(response.statusCode);
      print(response.body);
     // print(jsonDecode(await response.body)['message']);
      emit(WebSchoolAddStaffErrorState(error:response.body ));
    }




  }


}
