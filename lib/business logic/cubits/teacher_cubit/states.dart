import 'package:web_schoolapp/data/models/teacher_profile_model.dart';

import '../../../data/models/registerModel.dart';

abstract class AppTeacherWebStates {}

class AppTeacherWebInitialState extends AppTeacherWebStates {}

class AppTeacherWebChangePasswordVisibilityState extends AppTeacherWebStates {}

class AppTeacherWebChangeConfirmPasswordVisibilityState
    extends AppTeacherWebStates {}

class AppTeacherWebChangeClassState extends AppTeacherWebStates {}

class AppTeacherWebChangeGenderState extends AppTeacherWebStates {}

class AppTeacherWebSelectSubjectState extends AppTeacherWebStates {}

class AppAllTeacherState extends AppTeacherWebStates {}

class AppSearchFilterNameTeacherState extends AppTeacherWebStates {}

class AppTeacherRegisterLoadingState extends AppTeacherWebStates {}

class AppTeacherRegisterSuccessState extends AppTeacherWebStates {
  final RegisterModel teacherRegisterModel;

  AppTeacherRegisterSuccessState(this.teacherRegisterModel);
}

class AppTeacherRegisterErrorState extends AppTeacherWebStates {
  final String error;

  AppTeacherRegisterErrorState({required this.error});
}

class AppTeacherProfileLoadingState extends AppTeacherWebStates {}

class AppTeacherProfileSuccessState extends AppTeacherWebStates {
  final TeacherProfileModel teacherProfileModel;

  AppTeacherProfileSuccessState(this.teacherProfileModel);
}

class AppTeacherProfileErrorState extends AppTeacherWebStates {
  final String error;

  AppTeacherProfileErrorState(this.error);
}
