import 'package:web_schoolapp/data/models/activate_user_model.dart';
import 'package:web_schoolapp/data/models/teacher_edit_profile_model.dart';
import 'package:web_schoolapp/data/models/teacher_profile_model.dart';

import '../../../data/models/registerModel.dart';
import '../../../data/models/show_teachers_model.dart';

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

class AppChangeActiveTeacherState extends AppTeacherWebStates {}
class AppShowTeacherLoadingState extends AppTeacherWebStates {}
class AppShowTeacherSuccessState extends AppTeacherWebStates
{
  final ShowTeacherModel showTeachersModel;

  AppShowTeacherSuccessState(this.showTeachersModel);
}
class AppShowTeacherErrorState extends AppTeacherWebStates
{
final String error;

  AppShowTeacherErrorState(this.error);

}


class AppTeacherRegisterLoadingState extends AppTeacherWebStates{}
class AppTeacherRegisterSuccessState extends AppTeacherWebStates{
  final RegisterModel teacherRegisterModel;
  AppTeacherRegisterSuccessState(this.teacherRegisterModel);
}
class AppTeacherRegisterErrorState extends AppTeacherWebStates{
  final String error;

  AppTeacherRegisterErrorState({required this.error});
}


class AppTeacherProfileLoadingState extends AppTeacherWebStates{}
class AppTeacherProfileSuccessState extends AppTeacherWebStates{
  final TeacherProfileModel teacherProfileModel;
  AppTeacherProfileSuccessState(this.teacherProfileModel);
}
class AppTeacherProfileErrorState extends AppTeacherWebStates{
  final String error;

  AppTeacherProfileErrorState(this.error);
}

class AppTeacherActivateLoadingState extends AppTeacherWebStates{}
class AppTeacherActivateSuccessState extends AppTeacherWebStates{
  final ActivateUserModel activateUserModel;
  AppTeacherActivateSuccessState(this.activateUserModel);
}
class AppTeacherActivateErrorState extends AppTeacherWebStates{
  final String error;

  AppTeacherActivateErrorState(this.error);
}

class AppTeacherUpdateProfileLoadingState extends AppTeacherWebStates{}
class AppTeacherUpdateProfileSuccessState extends AppTeacherWebStates{
  final  UpdateTeacherModel updateTeacherModel;
  AppTeacherUpdateProfileSuccessState(this.updateTeacherModel);
}
class AppTeacherUpdateProfileErrorState extends AppTeacherWebStates{
  final String error;

  AppTeacherUpdateProfileErrorState(this.error);
}