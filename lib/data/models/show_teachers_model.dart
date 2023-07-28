class ShowTeacherModel {
  List<Teachers>? teachers;
  String? message;

  ShowTeacherModel({this.teachers, this.message});

  ShowTeacherModel.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Teachers{
  int? id;
  String? fullName;
  dynamic photo;

  Teachers({this.id, this.fullName, this.photo});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['photo'] = this.photo;
    return data;
  }
}
