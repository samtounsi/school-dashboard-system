import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/exam_table_cubit/state.dart';
import 'package:web_schoolapp/data/models/add_exam_table_message_model.dart';
import 'package:web_schoolapp/data/models/exam_table_model_send.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/components and constants/constants.dart';



class AddExamTableCubit extends Cubit<ExamTableState>
{
  AddExamTableCubit():super(InitialExamTableState());
  static AddExamTableCubit get(context)=>BlocProvider.of(context);
  AddExamTableMessage? addExamTableMessage;
  postExamTable( {required ExamTableSendModel data})async
  {
    emit(ExamTableAddLoadingState());

    var request = http.post(Uri.parse('https://new-school-management-system.onrender.com/add_exam_table'),
        headers:{
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data.toJson(data))
    );

    var response = await request;
    final Map<String, dynamic> json = jsonDecode(response.body);


    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      addExamTableMessage=AddExamTableMessage.fromJson(json);
      emit(ExamTableAddSuccessState(addExamTableMessage!));
    }
    else {
      String error=jsonDecode(jsonDecode(await response.body)['message']);
      emit(ExamTableAddErrorState(error: error));
      print(error);
    }
  }
  String? classValueAddExam;
  String changeGradeAddExamTable(classvalue)
  {
    this.classValueAddExam=classvalue;
    emit(AddExamChangeGradeState());
    print(classvalue);
    return classvalue;
  }
  int ? semesterValueAddExamTable;
  int changeSemesterAddExamTable(value) {
    this.semesterValueAddExamTable = value;
    print(value);
    emit(AddExamChangeSemesterState());
    return value;
  }

}