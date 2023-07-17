import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/feedback_cubit/state.dart';
import 'package:http/http.dart' as http;
import 'package:web_schoolapp/data/models/feedBack_model.dart';

import '../../presentation/components and constants/constants.dart';

class FeedbackCubit extends Cubit<FeedbackState>
{
  FeedbackCubit():super(FeedbackInitialState());
  static FeedbackCubit get(context)=>BlocProvider.of(context);
  void getFeedback() async {

    emit(FeedbackLoadingState());
    try{
      final result = await http.get(
        Uri.parse(
            "https://new-school-management-system.onrender.com/web/get_feedback"),

        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token'
        },
      );
      print(result.body);
      final Map<String, dynamic> json = jsonDecode(result.body);

      print(json);

      if (result.statusCode == 200) {

        List<FeedBackModel> feedbacks = (json['feedbacks'] as List)
            .map((e) => FeedBackModel.fromJson(e))
            .toList();

        emit(FeedbackSuccessState(feedbacks));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(FeedbackErrorState(errorFeedback: e.toString()));
    }
  }



}