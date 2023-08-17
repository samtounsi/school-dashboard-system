
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/states.dart';
import 'package:web_schoolapp/presentation/classes/lessons.dart';

import '../../../data/models/get_timetable_model.dart';
import '../../../data/models/show_sections.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart'as http;


class  ShowTimetableCubit extends Cubit< ShowTimetableStates>{
  ShowTimetableCubit():super ( ShowTimetableInitialState());

  static  ShowTimetableCubit get(context)=>BlocProvider.of(context);

  var gradeValue;
  String getGrade(grade)
  {
    gradeValue=grade;
    emit(ClassChangeClassState());
    print(gradeValue);
    return gradeValue;
  }
  String sectionValue='1';
  String changeSection(value) {
    this.sectionValue = value;
    print(value);
    emit(ClassChangeSectionState());
    return value;
  }
  ShowSections? showSection;
  List? sections;
  Future showSections({
    String? grade
  })async
  {
    emit(ShowSectionsLoadingState());

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/web/get_sections/$gradeValue'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      showSection=ShowSections.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(showSection?.toJson().toString());
      sectionValue=showSection!.sectionNumbers![0].toString();
      sections=showSection?.sectionNumbers;
      print(grade);
      emit(ShowSectionsSuccessState(showSection!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(ShowSectionsErrorState(error:error));
      print(error);
    }
    return showSection;
  }


  GetTimetableModel? showTimetableModel;
  GetTimetableModel? emptyTable;
  showTimetable({grade,section})async
  {
    emit(AppShowTimetableLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_time_table'));
    request.fields.addAll({
      'section': sectionValue,
      'grade': grade
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if(showTimetableModel!=null)
      {
        showTimetableModel=null;
      }
      showTimetableModel=GetTimetableModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(showTimetableModel?.toJson().toString());
      print(gradeValue);
      print(sectionValue);
      emit(AppShowTimetableSuccessState(showTimetableModel!));
    }
    else if(response.statusCode==400)
    {

      showTimetableModel=GetTimetableModel
        (
          exist: 0,
          daysLessons:  [
            DaysLessons( day: "Sun",
                first: " ",
                second: " ",
                third: " ",
                fourth: " ",
                fifth: " ",
                sixth: " "),
            DaysLessons( day: "Mon",
                first: " ",
                second: " ",
                third: " ",
                fourth: " ",
                fifth: " ",
                sixth: " "),
            DaysLessons( day: "Tue",
                first: " ",
                second: " ",
                third: " ",
                fourth: " ",
                fifth: " ",
                sixth: " "),
            DaysLessons( day: "Wed",
                first: " ",
                second: " ",
                third: " ",
                fourth: " ",
                fifth: " ",
                sixth: " "),
            DaysLessons( day: "Thu",
                first: " ",
                second: " ",
                third: " ",
                fourth: " ",
                fifth: " ",
                sixth: " "),
          ],
          arabicTeacher:' ',
          englishTeacher:' ',
          frenchTeacher:' ',
          mathTeacher:' ',
          physicsTeacher:' ',
          chemistryTeacher: ' ',
          artTeacher: ' ',
          musicTeacher:' ',
          sportsTeacher:' ',
          socialTeacher:' ',
          cultureTeacher:' ',
          religionTeacher:' ',
          philosophyTeacher:' ',
          scienceTeacher:' ',
          technologyTeacher:' ',
        message: "time table has not been added yet"
      );
      emit(GetTimetableEmptyState(showTimetableModel!));
    }
    else{
      String error=jsonDecode(jsonDecode(await response.stream.bytesToString())['message']);
      emit(AppShowTimetableErrorState(error: error));
      print(error);
    }

  }

}
