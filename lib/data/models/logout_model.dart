class LogoutModel {
  String? message;
  LogoutModel({this.message});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
  }

  Map<String, dynamic> toJson() => {'message': message};
}
