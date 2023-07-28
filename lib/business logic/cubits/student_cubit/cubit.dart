import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/add_attendance_student_model.dart';
import '../../../data/models/certificate_model.dart';
import '../../../data/models/search_student_parameters.dart';
import '../../../data/models/studentRegisterModel.dart';
import '../../../data/models/student_model.dart';
import '../../../presentation/components and constants/constants.dart';

class StudentCubit extends Cubit<DashBoardState> {
  StudentCubit() : super(InitialState());

  static StudentCubit get(context) => BlocProvider.of(context);
  String? dropDown1;

  void changeGrade(String value) {
    dropDown1 = value;
    emit(ChangeGradeState());
  }

  String? dropDown2;

  void changeSection(String value) {
    dropDown2 = value;
    emit(ChangeSectionState());
  }

  String? newDate;

  void changeDate(String value) {
    newDate = value;
    emit(ChangeDateBirth());
  }

  String? gender;

  void changeGender(String value) {
    gender = value;
    emit(ChangeGenderState());
  }

  String? editP;

  void editProfile(String name) {
    editP = name;
  }

  List<Map<String, dynamic>> foundUsers = [];

  // void getList() {
  //   foundUsers = _allUsers;
  //   emit(AllDataState());
  // }
  //
  // void runFilter(String gradeValue, String sectionValue, String nameValue) {
  //   List<Map<String, dynamic>> results = [];
  //   if (nameValue.isEmpty && sectionValue.isEmpty && gradeValue.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     getList();
  //   } else {
  //     results = _allUsers
  //         .where((user) =>
  //             user["class"].contains(gradeValue) &&
  //             user["section"].contains(sectionValue) &&
  //             user["name"].toLowerCase().contains(nameValue.toLowerCase()))
  //         .toList();
  //     foundUsers = results;
  //     emit(SearchFilteredState());
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }
  // }

  List<Map<String, dynamic>> sectionUser = [];

  // void section(String section) {
  //   List<Map<String, dynamic>> studentSection = [];
  //   studentSection = _allUsers
  //       .where((element) => element["section"].contains(section))
  //       .toList();
  //   sectionUser = studentSection;
  //   emit(StudentSectionState());
  // }

  final List<String> nameAttendance = [];

  void toggleCheck(String id) {
    final isExist = nameAttendance.contains(id);
    if (isExist) {
      nameAttendance.remove(id);
    } else {
      nameAttendance.add(id);
    }

    emit(ToggleState());
    print(nameAttendance);
  }

  bool isExist(String id) {
    final isExist = nameAttendance.contains(id);
    return isExist;
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(StudentChangePasswordVisibilityState());
  }

  bool isActive = true;

  void activeCheck(bool active) {
    isActive = active;

    emit(ActiveState());
    searchStudent(SearchStudentParameters(isActive: isActive));
  }

  RegisterModel? studentRegisterModel;

  postAddStudent({required RegisterModelStudent data}) async {
    emit(AppStudentRegisterLoading());
    final url =
        "https://new-school-management-system.onrender.com/web/student_register";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      };
      final register = {
        'first_name': data.firstName,
        'last_name': data.lastName,
        'father_name': data.fatherName,
        'mother_name': data.motherName,
        'mother_last_name': data.motherLastName,
        'grade': data.grade,
        'address': data.address,
        'phone_number': data.phoneNumber,
        'parent_number': data.parentNumber,
        'telephone_number': data.telephoneNumber,
        'gender': data.gender,
        'GPA': data.gba,
        'birthday': data.birthday,
        'nationality': data.nationality
      };
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(register));

      final Map<String, dynamic> json = jsonDecode(response.body);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200)
      {
        studentRegisterModel=RegisterModel.fromJson(json);
        emit(AppStudentRegisterSuccessState(studentRegisterModel!));
      }
      else{
        throw Exception(json['message']);
      }
    } catch (e) {
      emit(AppStudentRegisterErrorState(error:e.toString()));
    }
  }

  List<StudentModel>? students;

  void searchStudent(SearchStudentParameters parameters) async {
    emit(StudentSearchLoadingState());

    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://new-school-management-system.onrender.com/web/view_students"),
      );
      request.fields.addAll({
        if (parameters.grade != null) 'grade': parameters.grade.toString(),
        if (parameters.section != null)
          'section': parameters.section!.toString(),
        if (parameters.name != null) 'name': parameters.name!,
        'is_active': parameters.isActive.toString(),
      });

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      });
// we send request in this line
      final response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);

      print(json);
      print(myResponse.statusCode);

      if (myResponse.statusCode == 200) {
        // List<StudentModel> students
        students = (json['students'][0] as List)
            .map((e) => StudentModel.fromJson(e))
            .toList();

        emit(StudentSearchSuccessfulState(students!));
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      emit(StudentSearchErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> postListAndDates(
      AddAttendanceStudentModel addAttendanceStudentModel) async {
    emit(AttendanceStudentLoadingState());
    final url =
        'https://new-school-management-system.onrender.com/web/add_absent_students';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    final data = {
      'absent_students': addAttendanceStudentModel.attendance,
      'date': addAttendanceStudentModel.date
    };
    final jsonBody = jsonEncode(data);
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      emit(AttendanceStudentSuccessfulState());
    } else {
      emit(AttendanceStudentErrorState(error: "Error"));
    }
  }

}
