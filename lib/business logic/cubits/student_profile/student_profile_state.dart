import 'package:web_schoolapp/data/models/editprofile_student_success_model.dart';
import 'package:web_schoolapp/data/models/success_parent_edit_model.dart';
import 'package:web_schoolapp/presentation/screens/profile_student.dart';

import '../../../data/models/student_profile_model.dart';

abstract class StudentProfileState {}

class InitialStudentProfileState extends StudentProfileState {}

class LoadingStudentProfileState extends StudentProfileState {}

class ErrorStudentProfileState extends StudentProfileState {
  final String errorMessage;

  ErrorStudentProfileState(this.errorMessage);
}

class SuccessStudentPorfileState extends StudentProfileState {
  final StudentProfileModel student;

  SuccessStudentPorfileState(this.student);
}

class StudentProfileChangePasswordVisibilityState extends StudentProfileState {}

class AppDateStateLoading extends StudentProfileState {}

class SuccessUpdateStudentProfileState extends StudentProfileState {
  StudentProfileEditModel studentProfileEditModel;

  SuccessUpdateStudentProfileState(this.studentProfileEditModel);
}

class ErrorUpdateStudentProfileState extends StudentProfileState {
  String errorUpdate;

  ErrorUpdateStudentProfileState({required this.errorUpdate});
}

class LoadingUpdateStudentProfileState extends StudentProfileState {}

class SuccessUpdateParentProfileState extends StudentProfileState {
  ParentProfileEditModel parentProfileEditModel;

  SuccessUpdateParentProfileState(this.parentProfileEditModel);
}

class ErrorUpdateParentProfileState extends StudentProfileState {
  String errorParentUpdate;

  ErrorUpdateParentProfileState({required this.errorParentUpdate});
}

class LoadingUpdateParentProfileState extends StudentProfileState {}
