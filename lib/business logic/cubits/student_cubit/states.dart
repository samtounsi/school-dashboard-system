import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:web_schoolapp/data/models/student_model.dart';

abstract class DashBoardState {}

class InitialState extends DashBoardState {}

class ChangeGradeState extends DashBoardState {}

class ChangeSectionState extends DashBoardState {}

class ChangeDateBirth extends DashBoardState {}

class EditState extends DashBoardState {}

class SearchFilteredState extends DashBoardState {}

class AllDataState extends DashBoardState {}

class ChangeGenderState extends DashBoardState {}

class StudentSectionState extends DashBoardState {}

class ToggleState extends DashBoardState {}

class StudentChangePasswordVisibilityState extends DashBoardState {}

class ActiveState extends DashBoardState {}

class AppStudentRegisterLoading extends DashBoardState {}

class AppStudentRegisterSuccessState extends DashBoardState {
  final RegisterModel studentRegisterModel;

  AppStudentRegisterSuccessState(this.studentRegisterModel);
}

class AppStudentRegisterErrorState extends DashBoardState {
  final String error;

  AppStudentRegisterErrorState({required this.error});
}


// search states
  class StudentSearchLoadingState extends DashBoardState{}

class StudentSearchSuccessfulState extends DashBoardState{
  final List<StudentModel> students;
  StudentSearchSuccessfulState(this.students);
}
class StudentSearchErrorState extends DashBoardState{
  final String errorMessage;
  StudentSearchErrorState({required this.errorMessage});
}

// ended my state

class StudentSortSuccessfulState extends DashBoardState{}
class StudentSortLoadingState extends DashBoardState{}
class StudentSortErrorState extends DashBoardState{
  final String error;
  StudentSortErrorState({required this.error});
}
class StudentShowProfileSuccessfulState extends DashBoardState{}
class StudentShowProfileErrorState extends DashBoardState{
  final String error;
  StudentShowProfileErrorState({required this.error});
}
class StudentShowProfileLoadingState extends DashBoardState{}
class AttendanceStudentSuccessfulState extends DashBoardState{}
class AttendanceStudentErrorState extends DashBoardState{
  final String error;
  AttendanceStudentErrorState({required this.error});
}
class AttendanceStudentLoadingState extends DashBoardState{}
