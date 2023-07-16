import 'package:web_schoolapp/presentation/screens/profile_student.dart';

import '../../../data/models/student_profile_model.dart';

abstract class StudentProfileState {}

class InitialStudentProfileState extends StudentProfileState {}

class LoadingStudentProfileState extends StudentProfileState {}

class ErrorStudentProfileState extends StudentProfileState {
  final String errorMessage;
  ErrorStudentProfileState(this.errorMessage);
}

class SuccessStudentPorfileState extends StudentProfileState{
  final StudentProfileModel student;
  SuccessStudentPorfileState(this.student);
}


