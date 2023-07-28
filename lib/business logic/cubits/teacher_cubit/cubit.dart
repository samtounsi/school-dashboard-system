// ignore_for_file: unnecessary_import, avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:web_schoolapp/data/models/show_teachers_model.dart';
import 'package:web_schoolapp/data/models/teacherRegisterModel.dart';
import 'package:web_schoolapp/data/models/teacher_edit_profile_model.dart';
import 'package:web_schoolapp/data/models/teacher_profile_model.dart';
import '../../../data/models/activate_user_model.dart';
import '../../../data/models/teacher_show_model.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart'as http;

import '../../../presentation/screens/show_teachers.dart';

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
var request = http.post( Uri.parse('https://new-school-management-system.onrender.com/web/teacher_register'),
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

  String activeValue='true';
  String changeActive(value) {
    this.activeValue = value;
     //print(activeValue);
     //print(value);
   emit(AppChangeActiveTeacherState());
    return value;
  }

  ShowTeacherModel? showTeachersModel;
  Future<ShowTeacherModel?> showTeachers({activeValue})async
  {
    emit(AppShowTeacherLoadingState());
    var headers = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/view_teachers'));
    request.fields.addAll({
      'is_active': activeT
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
    //  print(response.statusCode);
     showTeachersModel=ShowTeacherModel.fromJson(jsonDecode(await response.stream.bytesToString()));
     // print(showTeachersModel?.toJson().toString());
      _allTeacher=showTeachersModel?.teachers;
     // print(_allTeacher![0].id.toString());
      emit(AppShowTeacherSuccessState(showTeachersModel! as ShowTeacherModel));
    }
    else {
     // print(response.statusCode);
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(AppShowTeacherErrorState(error));
    }
    return showTeachersModel;
  }

   List<Teachers>? _allTeacher;
  List<Teachers>? foundUsers = [];

  void getList() {
    foundUsers = _allTeacher;
   //print(foundUsers![0].fullName.toString());
    //print(foundUsers![0].id.toString());
    emit(AppAllTeacherState());
  }

  void runFilter(Teachers teacher) {
    List<Teachers> results = [];
    if (teacher.fullName!.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      getList();
    } else {
      results = _allTeacher
          !.where((user) =>

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

  ActivateUserModel? activateUserModel;
  Future activeUser({required String type, required id})async
  {
    emit(AppTeacherActivateLoadingState());
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
      emit(AppTeacherActivateSuccessState(activateUserModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppTeacherActivateErrorState(error));

    }

  }

  UpdateTeacherModel? updateTeacherModel;
  Future updateTeacherProfile({required UpdateTeacherModel data})async
  {
    emit(AppTeacherUpdateProfileLoadingState());
    try {
      const url ="https://new-school-management-system.onrender.com/web/update_teacher_profile";
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      };
      final updatePS = {
        'id':data.id.toString(),
        'first_name':data.firstName,
        'last_name':data.lastName,
        'address' : data.address,
        'phone_number': data.phoneNumber,
        'gender': data.gender,
        'birthday' : data.birthday,
        'years_of_experience' : data.yearsOfExperience,
        'nationality' : data.nationality,
        'subjects': data.subjects,
        'university':data.university,
        'email':data.email,
        'username': data.userName,
        'password': data.password
      };
      final jsonBody = jsonEncode(updatePS);
      final request =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);
      final Map<String, dynamic> json = jsonDecode(request.body);
      print(request.statusCode);
      print(json);
      if (request.statusCode == 201) {
        updateTeacherModel = UpdateTeacherModel.fromJson(json);
        emit(AppTeacherUpdateProfileSuccessState(updateTeacherModel!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(AppTeacherUpdateProfileErrorState(e.toString()));
      print(e.toString());
    }
  }
}
