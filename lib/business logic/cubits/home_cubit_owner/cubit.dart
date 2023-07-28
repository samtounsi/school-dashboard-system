import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit_owner/states.dart';
import 'package:http/http.dart' as http;
import 'package:web_schoolapp/data/models/add_date_model.dart';
import 'package:web_schoolapp/data/models/add_event_model.dart';
import 'package:web_schoolapp/data/models/add_event_response_model.dart';
import 'package:web_schoolapp/data/models/home_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class WebHomeCubit extends Cubit<WebHomeStates> {
  WebHomeCubit() : super(WebHomeInitState());

  static WebHomeCubit get(context) => BlocProvider.of(context);

  //highlight today
  DateTime selectedDate = DateTime.now();
  //get home data
  HomeModel? model;
  void getHomeWebData({required int year, required String token}) async {
    emit(WebHomeLoadingState());
    print(token);
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/web/home_page'));
    request.fields.addAll({'year': year.toString()});
    request.headers['Authorization'] = 'Bearer $token';
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      print(year);
      print(token);
      model =
          HomeModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      emit(WebHomeSuccessfulState(model!));
      print(model!.toJson().toString());
      //print(model!.holidays![0].type);
    } else {
      emit(WebHomeErrorState(
          error: jsonDecode(await response.stream.bytesToString())['message']
              .toString()));
      print('Error');
    }
    selectedDate = DateTime(year, DateTime.now().month, DateTime.now().day);
  }

  //add dates
  NewDateModel? dateModel;
  void newDate(
      {required String type,
      required String name,
      required String start_date,
      required String end_date,
      required String token}) async {
    emit(WebHomeNewDateLoadingState());
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/web/add_to_calander'));
    request.fields.addAll({
      'type': type,
      'name': name,
      'start_date': start_date,
      'end_date': end_date,
    });
    request.headers['Authorization'] = 'Bearer $token';
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      print(type);
      print(token);
      dateModel = NewDateModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      emit(WebHomeNewDateSuccessfulState(dateModel!));
      print(dateModel!.toJson().toString());
    } else {
      emit(WebHomeNewDateErrorState(
          error: jsonDecode(await response.stream.bytesToString())['message']
              .toString()));
      print('Error');
    }
  }

  //post announcement
  AddEventResponseModel? addEventResponseModel;
  Future postEvent({required AddEventModel data})async
  {
   emit(NewPostEventLoadingState());
    var request = http.post( Uri.parse('https://new-school-management-system.onrender.com/web/add_event'),
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
      addEventResponseModel=AddEventResponseModel.fromJson(jsonDecode(await response.body));
      print(addEventResponseModel?.message.toString());
      emit(NewPostEventSuccessState(addEventResponseModel!));
  }
  else {
      print(response.statusCode);
      print(response.body);
      // print(jsonDecode(await response.body)['message']);
      emit(NewPostEventErrorState(jsonDecode(await response.body)['message']));
  }

  }





  //mark start\end of the registeration
  List<dynamic> registerEventPred(DateTime day,
      {DateTime? startRegister, DateTime? endRegister}) {
    if (isSameDay(startRegister, day) || isSameDay(endRegister, day)) {
      return ['event'];
    }
    return [];
  }

  //highlight the start\end of the Year
  bool selectPred(DateTime day, {DateTime? startWork, DateTime? endWork}) {
    return isSameDay(startWork, day) || isSameDay(endWork, day);
  }

  //highlight holidays
  bool isYearHoliday(DateTime day, {List<Holidays>? holidays}) {
    return holidays!.any((element) => (isSameDay(element.startDate, day)));
  }

  //helper
  bool isSame(int a, int b) {
    if (a == b)
      return true;
    else
      return false;
  }
}
