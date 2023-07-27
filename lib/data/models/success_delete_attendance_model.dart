//model for response api delete date from list absences
class SuccessDeleteAttendanceModel {
  final List<DateTime> absences;
  final String message;

  SuccessDeleteAttendanceModel({required this.absences, required this.message});

  factory SuccessDeleteAttendanceModel.fromJson(Map<String, dynamic> json) {
    return SuccessDeleteAttendanceModel(
        absences:
        (json['absences'] as List).map((e) => DateTime.parse(e)).toList(),
        message: json['message']);
  }
}
