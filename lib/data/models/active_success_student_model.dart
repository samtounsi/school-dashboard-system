//model for success api toggle
class SuccessActiveStudentModel {
  final String msg;

  SuccessActiveStudentModel({required this.msg});
  factory SuccessActiveStudentModel.fromJson(Map<String,dynamic>json)
  {
    return SuccessActiveStudentModel(msg: json['message']);
  }
}
