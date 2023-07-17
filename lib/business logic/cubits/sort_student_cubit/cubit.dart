import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/sort_student_cubit/state.dart';
import 'package:web_schoolapp/data/models/student_sort_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_schoolapp/data/models/success_sort_model.dart';

import '../../../presentation/components and constants/constants.dart';

class StudentSortCubit extends Cubit<SortStudentState> {
  StudentSortCubit() : super(InitialSortStudentState());

  static StudentSortCubit get(context) => BlocProvider.of(context);

  void sortStudentPost(StudentSortModel studentSortModel) async {
    emit(LoadingSortStudentState());
    try {
      var request = http.MultipartRequest(
          'Post',
          Uri.parse(
              'https://new-school-management-system.onrender.com/web/sort_students_on_sections'));
      request.fields.addAll({
        'seventh_sections_number': studentSortModel.numberSectionSeventh,
        'eightth_sections_number': studentSortModel.numberSectionEighth,
        'ninth_sections_number': studentSortModel.numberSectionNinth
      });
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      });

      final response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);

      print(json);
      print(myResponse.statusCode);
      if (myResponse.statusCode == 201) {
        emit(SuccessSortStudentState());
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      emit(ErrorSortStudentState(error: e.toString()));
    }
  }
}
