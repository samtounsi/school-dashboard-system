import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/delete_attendance_cubit/state.dart';
import 'package:web_schoolapp/data/models/delete_attendance_model.dart';

import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart' as http;


class DeleteAttendanceCubit extends Cubit<DeleteAttendanceState>
{
  DeleteAttendanceCubit():super(DeleteAttendanceInitialState());
  static DeleteAttendanceCubit get(context)=>BlocProvider.of(context);
  Future<void> postDeleteAttendance(
      DeleteAttendanceModel deleteAttendanceModel) async {
    emit(DeleteAttendanceLoadingState());
    final url =
        'https://new-school-management-system.onrender.com/web/delete_absent_student';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    final data = {
      'student_id': deleteAttendanceModel.studentId,
      'date': deleteAttendanceModel.date
    };
    final jsonBody = jsonEncode(data);
    final response =
    await http.post(Uri.parse(url), headers: headers, body: jsonBody);
    print(response.statusCode);
    print(response.body);
}}