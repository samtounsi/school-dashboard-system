abstract class SortStudentState {}

class InitialSortStudentState extends SortStudentState {}

class LoadingSortStudentState extends SortStudentState {}

class SuccessSortStudentState extends SortStudentState {}

class ErrorSortStudentState extends SortStudentState {
  final String error;

  ErrorSortStudentState({required this.error});
}
