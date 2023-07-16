import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_state.dart';
import 'package:web_schoolapp/presentation/screens/profile_student.dart';

import '../../../data/models/student_profile_model.dart';
import '../../../presentation/components and constants/constants.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit() : super(InitialStudentProfileState());

  static StudentProfileCubit get(context) => BlocProvider.of(context);
  StudentProfileModel? studentProfileModel;

  void getStudentProfile(int studentId) async {
    emit(LoadingStudentProfileState());

    try {
      final result = await http.get(
        Uri.parse(
            "https://new-school-management-system.onrender.com/web/student_profile/$studentId"),

        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token'
        },
      );
      print(result.body);
      final Map<String, dynamic> json = jsonDecode(result.body);

      print(json);

      if (result.statusCode == 201) {
        final model = StudentProfileModel.fromJson(json);

        emit(SuccessStudentPorfileState(model));

      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(ErrorStudentProfileState(e.toString()));
    }
  }

}

