class TeacherSubjectModel {
  List<String>? teachers;
  String? message;

  TeacherSubjectModel({this.teachers, this.message});

  TeacherSubjectModel.fromJson(Map<String, dynamic> json) {
    teachers = json['teachers'].cast<String>();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teachers'] = this.teachers;
    data['message'] = this.message;
    return data;
  }
}
