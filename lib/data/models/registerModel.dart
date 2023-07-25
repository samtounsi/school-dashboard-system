class RegisterModel {
  final int id;
  final String username;
  final String password;
  final String parentUsername;
  final String parentPassword;
  final String message;

  RegisterModel({required this.id,
    required this.username,
    required this.password,
    required this.parentUsername,
    required this.parentPassword,
    required this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(id: json['id'],
        username: json['username'],
        password: json['password'],
        parentUsername: json['parent_username'],
        parentPassword:json['parent_password'],
        message:json['message']);

}}
