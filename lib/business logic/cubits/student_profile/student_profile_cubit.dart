import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_state.dart';
import 'package:web_schoolapp/data/models/active_success_student_model.dart';
import 'package:web_schoolapp/data/models/send_edit_student_profile_model.dart';
import 'package:web_schoolapp/data/models/success_delete_attendance_model.dart';
import 'package:web_schoolapp/presentation/screens/profile_student.dart';

import '../../../data/models/active_send_student_model.dart';
import '../../../data/models/certificate_model.dart';
import '../../../data/models/delete_attendance_model.dart';
import '../../../data/models/editprofile_student_success_model.dart';
import '../../../data/models/get_years_model.dart';
import '../../../data/models/send_parent_edit_model.dart';
import '../../../data/models/student_profile_model.dart';
import '../../../data/models/success_parent_edit_model.dart';
import '../../../presentation/components and constants/constants.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit() : super(InitialStudentProfileState());

  static StudentProfileCubit get(context) => BlocProvider.of(context);
  StudentProfileModel? studentProfileModel;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(StudentProfileChangePasswordVisibilityState());
  }

  StudentProfileModel? studentProfile;

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
        // final model = StudentProfileModel.fromJson(json);
        studentProfile = StudentProfileModel.fromJson(json);

        emit(SuccessStudentPorfileState(studentProfile!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(ErrorStudentProfileState(e.toString()));
    }
  }

  StudentProfileEditModel? studentProfileE;

  void updateStudentProfile(StudentProfileEditSendModel sendModel) async {
    emit(LoadingUpdateStudentProfileState());
    try {
      final url =
          "https://new-school-management-system.onrender.com/web/update_student_profile";
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      };
      final updatePS = {
        'id': sendModel.id,
        'username': sendModel.userNameEditS,
        'password': sendModel.passwordEditS,
        'first_name': sendModel.firstNameEditS,
        'last_name': sendModel.lastNameEditS,
        'father_name': sendModel.fatherNameEditS,
        'mother_name': sendModel.motherNameEditS,
        'mother_last_name': sendModel.motherLastNameEditS,
        'grade': sendModel.gradeNameEditS,
        'address': sendModel.addressEditS,
        'phone_number': sendModel.phoneNumberEditS,
        'parent_number': sendModel.parentPhoneNumberEditS,
        'telephone_number': sendModel.telephoneNumberEditS,
        'gender': sendModel.genderEditS,
        'GPA': sendModel.gbaEditS,
        'birthday': sendModel.birthdayEditS,
        'nationality': sendModel.nationalityEditS,
        'section': sendModel.classNameEditS,
      };
      final jsonBody = jsonEncode(updatePS);
      final request =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);
      final Map<String, dynamic> json = jsonDecode(request.body);
      print(request.statusCode);
      print(json);
      if (request.statusCode == 201) {
        studentProfileE = StudentProfileEditModel.fromJson(json);
        emit(SuccessUpdateStudentProfileState(studentProfileE!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(ErrorUpdateStudentProfileState(errorUpdate: e.toString()));
      print(e.toString());
    }
  }

  ParentProfileEditModel? parentProfileE;

  void updateParentProfile(ParentProfileEditSendModel sendParentModel) async {
    emit(LoadingUpdateParentProfileState());
    try {
      final url =
          "https://new-school-management-system.onrender.com/web/update_parent_profile";
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      };
      final updatePS = {
        'id': sendParentModel.idParentEdit,
        'username': sendParentModel.userNameParentEditS,
        'password': sendParentModel.passwordParentEditS,
        'name': sendParentModel.nameParentEditS,
      };
      final jsonBody = jsonEncode(updatePS);
      final request =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);
      final Map<String, dynamic> json = jsonDecode(request.body);
      print(request.statusCode);
      print(json);
      if (request.statusCode == 200) {
        parentProfileE = ParentProfileEditModel.fromJson(json);
        emit(SuccessUpdateParentProfileState(parentProfileE!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(ErrorUpdateParentProfileState(errorParentUpdate: e.toString()));
      print(e.toString());
    }
    // }
  }

  SuccessDeleteAttendanceModel? s;

  Future<void> postDeleteAttendance(
      DeleteAttendanceModel deleteAttendanceModel) async {
    emit(DeleteAttendanceLoadingState());
    try {
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
      Map<String, dynamic> json = jsonDecode(response.body);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        s = SuccessDeleteAttendanceModel.fromJson(json);
        emit(DeleteAttendanceSuccessState(s!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(DeleteAttendanceErrorState(errorDelete: e.toString()));
      print(e.toString());
    }
  }

  SuccessActiveStudentModel? successActive;

  void changeStateStudent(ActiveStudentSendModel activeStudentSendModel) async {
    emit(ChangeStateStudentLoadingState());
    try {
      final url =
          'https://new-school-management-system.onrender.com/web/activate_user';
      final headres = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      };
      final c = {
        'type': activeStudentSendModel.typeA,
        'id': activeStudentSendModel.idA,
      };
      final jsonBody = jsonEncode(c);
      final response =
          await http.post(Uri.parse(url), headers: headres, body: jsonBody);
      Map<String, dynamic> json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        successActive = SuccessActiveStudentModel.fromJson(json);
        emit(ChangeStateStudentSuccessState(successActive!));
      }
      else{
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(ChangeStateStudentErrorState(errorState: e.toString()));
    }
  }
  bool isStateActive = true;
  IconData iconData = Icons.delete_forever_outlined;

  void changeState() {
    isStateActive = !isStateActive;
    iconData =
    isStateActive ? Icons.delete_forever_outlined : Icons.add_box;

    emit(ChangeIconState());
  }
  CertificateModel certificateModel=CertificateModel
    (
    message: ' ',
      firstSemester:[
        FirstSemester(subject: '',
          marks:Mark(
            midMarkFirstSemester: ' ',
            finalMarkFirstSemester: ' ',
            quizPrizeFirstSemester: ' '
          )
          ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
        FirstSemester(subject: '',
            marks:Mark(
                midMarkFirstSemester: ' ',
                finalMarkFirstSemester: ' ',
                quizPrizeFirstSemester: ' '
            )
            ,totalMark:''),
      ],
      secondSemester:[
      SecondSemester(subject: '',
        marks:Marks(
        midMarkSecondSemester: ' ',
        finalMarkSecondSemester: ' ',
        quizPrizeSecondSemester: ' '
        )
        ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' '),
      SecondSemester(subject: '',
          marks:Marks(
              midMarkSecondSemester: ' ',
              finalMarkSecondSemester: ' ',
              quizPrizeSecondSemester: ' '
          )
          ,totalMark:' ')
    ],
    );
  getCertificate({int? id,year})async
  {
    emit(AppStaffWebGetCertificateLoadingState());
    var headers = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/web/get_student_marks'));
    request.fields.addAll({
      'year_date': year,
      'id': id.toString()
    });
    request.headers.addAll(headers);
    var response = await request.send();

    if (response.statusCode == 201) {
      print(response.statusCode);
      certificateModel=CertificateModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(certificateModel?.toJson().toString());
      emit( AppStaffWebGetCertificateSuccessState(certificateModel!));
    }
    else if(response.statusCode==422)
    {
      certificateModel=CertificateModel
        (
        message: ' ',
        firstSemester:[
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
          FirstSemester(subject: '',
              marks:Mark(
                  midMarkFirstSemester: ' ',
                  finalMarkFirstSemester: ' ',
                  quizPrizeFirstSemester: ' '
              )
              ,totalMark:''),
        ],
        secondSemester:[
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' '),
          SecondSemester(subject: '',
              marks:Marks(
                  midMarkSecondSemester: ' ',
                  finalMarkSecondSemester: ' ',
                  quizPrizeSecondSemester: ' '
              )
              ,totalMark:' ')
        ],
      );
      emit( AppStaffWebGetCertificateSuccessState(certificateModel!));
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      String error=jsonDecode(await response.stream.bytesToString())['message'].toString();
      emit(AppStaffWebGetCertificateErrorState(error:error));
    }
  }

  String? yearValue;
  String changeYear(yearValue)
  {
    this.yearValue=yearValue;
    emit(ChangeYearState());
    print(yearValue);
    return yearValue;
  }
  GetYearsModel? getYearsModel;
  Future getYears({studentId})async
  {
    emit(GetYearsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/get_years/$studentId'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      getYearsModel=GetYearsModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(getYearsModel?.toJson().toString());
      emit(GetYearsSuccessState(getYearsModel!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(GetYearsErrorState(error));
    }

  }
}
