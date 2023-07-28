//model for send attendance (absences students)
class AddAttendanceStudentModel {
  final List<String> attendance;
  final String date;

  AddAttendanceStudentModel({
    required this.date,
    required this.attendance,
  });
}
