
class RegisterModel {
  int? id;
  String? username;
  String? password;
  String? parentUsername;
  String? parentPassword;
  String? message;

  RegisterModel(
      {this.id,
        this.username,
        this.password,
        this.parentUsername,
        this.parentPassword,
        this.message});
  RegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    parentUsername = json['parent_username'];
    parentPassword = json['parent_password'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['parent_username'] = this.parentUsername;
    data['parent_password'] = this.parentPassword;
    data['message'] = this.message;
    return data;
  }
}
