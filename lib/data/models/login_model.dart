

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.type,
    this.token,
    this.message,
  });

  String? type;
  String? token;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    type: json["type"],
    token:json['token'] ,
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "token": token,
    "message": message,
  };
}
