import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit_staff/states.dart';
import 'package:http/http.dart' as http;
import 'package:web_schoolapp/data/models/home_model.dart';

class WebHomeStaffCubit extends Cubit<WebHomeStaffStates> {
  WebHomeStaffCubit() : super(GetStaffHomeDataInitState());

  static WebHomeStaffCubit get(context) => BlocProvider.of(context);

  //highlight today
  DateTime selectedDate = DateTime.now();
  //get home data
  HomeModel? model;
  void getHomeWebData({required int year, required String token}) async {
    emit(GetStaffHomeDataLoadingState());
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
      emit(GetStaffHomeDataSuccessState(model!));
      print(model!.toJson().toString());
      //print(model!.holidays![0].type);
    } else {
      emit(GetStaffHomeDataErrorState(
          jsonDecode(await response.stream.bytesToString())['message']
              .toString()));
      print('Error');
    }
    selectedDate = DateTime(year, DateTime.now().month, DateTime.now().day);
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
