class StaffProfileModel {
  String? username;
  String? firstName;
  String? lastName;
  String? address;
  String? gender;
  String? phoneNumber;
  String? birthday;
  String? message;

  StaffProfileModel(
      {this.username,
        this.firstName,
        this.lastName,
        this.address,
        this.gender,
        this.phoneNumber,
        this.birthday,
        this.message});

  StaffProfileModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    birthday = json['birthday'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['birthday'] = this.birthday;
    data['message'] = this.message;
    return data;
  }
}
