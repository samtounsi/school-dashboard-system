import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/states.dart';
import 'package:web_schoolapp/data/models/add_timetable_response_model.dart';
import 'package:web_schoolapp/data/models/teacher_subject_model.dart';

import '../../../data/models/add_time_table_model.dart';
import '../../../data/models/show_sections.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart'as http;

import '../../../presentation/screens/time_table.dart';


class TimetableCubit extends Cubit<TimetableStates>
{
  TimetableCubit():super(TimetableInitialState());
  static TimetableCubit get(context)=>BlocProvider.of(context);


  String sectionValue="1";
  String changeSection(value) {
    this.sectionValue = value;
   print(value);
    emit(TimetableChangeSectionState());

    return value;
  }



  ShowSections? showSection;
  List? sections;
   Future showSections({
    String? grade
})async
  {
    emit(AppShowSectionsLoadingState());

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/web/get_sections/$grade'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      showSection=ShowSections.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(showSection?.toJson().toString());
      sectionValue=showSection!.sectionNumbers![0].toString();
      sections=showSection?.sectionNumbers;
      print(grade);
      emit(AppShowSectionsSuccessState(showSection!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowSectionsErrorState(error:error));
      print(error);
    }
  return showSection;
  }


  AddTimetableResponse? timetableResponse;
  postTimetable( {required AddTimeTable data})async
  {
    emit(AppAddTimetableLoadingState());

    var request = http.post(Uri.parse('https://new-school-management-system.onrender.com/web/add_time_table'),
        headers:{
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data.toJson(data))
    );

    var response = await request;

    if (response.statusCode == 200) {
      timetableResponse=AddTimetableResponse.fromJson(jsonDecode(await response.body));
      print(response.statusCode);
      print(response.body);
      emit(AppAddTimetableSuccessState(timetableResponse!));
    }
    else {
      String error=jsonDecode(jsonDecode(await response.body)['message']);
      emit(AppAddTimetableErrorState(error: error));
      print(error);
    }
  }



  String? arabicValue;
  String changeArabicTeacher(value) {
    this.arabicValue = value;
    print(value);
    emit(TimetableChangeArabicTeacherState());
    return value;
  }

  String? englishValue;
  String changeEnglishTeacher(value) {
    this.englishValue = value;
    print(value);
    emit(TimetableChangeEnglishTeacherState());
    return value;
  }
  String? frenchValue;
  String changeFrenchTeacher(value) {
    this.frenchValue = value;
    print(value);
    emit(TimetableChangeFrenchTeacherState());
    return value;
  }

  String? mathValue;
  String changeMathTeacher(value) {
    this.mathValue = value;
    print(value);
    emit(TimetableChangeMathTeacherState());
    return value;
  }

  String? physicsValue;
  String changePhysicsTeacher(value) {
    this.physicsValue = value;
    print(value);
    emit(TimetableChangePhysicsTeacherState());
    return value;
  }

  String? chemistryValue;
  String changeChemistryTeacher(value) {
    this.chemistryValue = value;
    print(value);
    emit(TimetableChangeChemistryTeacherState());
    return value;
  }

  String? artValue;
  String changeArtTeacher(value) {
    this.artValue = value;
    print(value);
    emit(TimetableChangeArtTeacherState());
    return value;
  }


  String? musicValue;
  String changeMusicTeacher(value) {
    this.musicValue = value;
    print(value);
    emit(TimetableChangeMusicTeacherState());
    return value;
  }


  String? sportsValue;
  String changeSportsTeacher(value) {
    this.sportsValue = value;
    print(value);
    emit(TimetableChangeSportsTeacherState());
    return value;
  }


  String? socialValue;
  String changeSocialTeacher(value) {
    this.socialValue = value;
    print(value);
    emit(TimetableChangeSocialTeacherState());
    return value;
  }


  String? cultureValue;
  String changeCultureTeacher(value) {
    this.cultureValue = value;
    print(value);
    emit(TimetableChangeCultureTeacherState());
    return value;
  }

  String? religionValue;
  String changeReligionTeacher(value) {
    this.religionValue = value;
    print(value);
    emit(TimetableChangeReligionTeacherState());
    return value;
  }

  String? philosophyValue;
  String changePhilosophyTeacher(value) {
    this.philosophyValue = value;
    print(value);
    emit(TimetableChangePhilosophyTeacherState());
    return value;
  }


  String? scienceValue;
  String changeScienceTeacher(value) {
    this.scienceValue = value;
    print(value);
    emit(TimetableChangeScienceTeacherState());
    return value;
  }


  String? technologyValue;
  String changeTechnologyTeacher(value) {
    this.technologyValue = value;
    print(value);
    emit(TimetableChangeTechnologyTeacherState());
    return value;
  }

  TeacherSubjectModel? teacherSubjectModel;
  showSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Arabic'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherSubjectModel!));
      return teacherSubjectModel!;
  }
  else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
  }

  }


  TeacherSubjectModel? teacherEnglishSubjectModel;
  showEnglishSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'English'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherEnglishSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherEnglishSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherEnglishSubjectModel!));
      return teacherEnglishSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherFrenchSubjectModel;
  showFrenchSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'French'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherFrenchSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherFrenchSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherFrenchSubjectModel!));
      return teacherFrenchSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherMathSubjectModel;
  showMathSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Math'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherMathSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherMathSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherMathSubjectModel!));
      return teacherMathSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherPhysicsSubjectModel;
  showPhysicsSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Physics'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherPhysicsSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherPhysicsSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherPhysicsSubjectModel!));
      return teacherPhysicsSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherChemistrySubjectModel;
  showChemistrySubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Chemistry'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherChemistrySubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherChemistrySubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherChemistrySubjectModel!));
      return teacherChemistrySubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherArtSubjectModel;
  showArtSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Art'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherArtSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherArtSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherArtSubjectModel!));
      return teacherArtSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherMusicSubjectModel;
  showMusicSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Music'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherMusicSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherMusicSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherMusicSubjectModel!));
      return teacherMusicSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherSportsSubjectModel;
  showSportsSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Sport'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherSportsSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherSportsSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherSportsSubjectModel!));
      return teacherSportsSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherSocialSubjectModel;
  showSocialSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Social studies'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherSocialSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherSocialSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherSocialSubjectModel!));
      return teacherSocialSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherCultureSubjectModel;
  showCultureSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Culture'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherCultureSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherCultureSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherCultureSubjectModel!));
      return teacherCultureSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherReligionSubjectModel;
  showReligionSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Religion'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherReligionSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherReligionSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherReligionSubjectModel!));
      return teacherReligionSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherPhilosophySubjectModel;
  showPhilosophySubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Philosophy'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherPhilosophySubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherPhilosophySubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherPhilosophySubjectModel!));
      return teacherPhilosophySubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherScienceSubjectModel;
  showScienceSubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Science'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherScienceSubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherScienceSubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherScienceSubjectModel!));
      return teacherScienceSubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }

  TeacherSubjectModel? teacherTechnologySubjectModel;
  showTechnologySubjectTeacher({subject})async
  {
    emit(AppShowTeachersSubjectsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_subject_teacher'));
    request.fields.addAll({
      'subject': 'Technology'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      teacherTechnologySubjectModel=TeacherSubjectModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      //print(await response.stream.bytesToString());
      print(teacherTechnologySubjectModel?.toJson().toString());
      emit(AppShowTeachersSubjectsSuccessState(teacherTechnologySubjectModel!));
      return teacherTechnologySubjectModel!;
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(AppShowTeachersSubjectsErrorState(error:error));
      print(error);
    }

  }



}