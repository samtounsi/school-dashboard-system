abstract class DeleteAttendanceState{}
class DeleteAttendanceInitialState extends DeleteAttendanceState{}
class DeleteAttendanceSuccessState extends DeleteAttendanceState{}
class DeleteAttendanceErrorState extends DeleteAttendanceState{
  String errorDelete;
  DeleteAttendanceErrorState({required this.errorDelete});
}
class DeleteAttendanceLoadingState extends DeleteAttendanceState{}

