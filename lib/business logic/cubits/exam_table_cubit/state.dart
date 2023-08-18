abstract class ExamTableState {}

class InitialExamTableState extends ExamTableState {}

class ExamTableAddSuccessState extends ExamTableState {}

class ExamTableAddLoadingState extends ExamTableState {}

class ExamTableAddErrorState extends ExamTableState {
  final String error;

  ExamTableAddErrorState({required this.error});
}
class AddExamChangeGradeState extends ExamTableState {}
class AddExamChangeSemesterState extends ExamTableState {}


