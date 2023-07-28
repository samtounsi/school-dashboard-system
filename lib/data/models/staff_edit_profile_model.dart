class UpdateStaffModel {
  String? id;
  String? firstName;
  String? lastName;
  String? address;
  String? phoneNumber;
  String? gender;
  String? birthday;
  String? username;
  String? password;

  UpdateStaffModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.phoneNumber,
        this.gender,
        this.birthday,
        this.username,
        this.password});

  UpdateStaffModel.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    birthday = json['birthday'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(UpdateStaffModel model) {
    return
      {
        'id':model.id,
    'first_name':model.firstName,
    'last_name':model.lastName,
    'address': model.address,
    'phone_number' : model.phoneNumber,
    'gender': model.gender,
    'birthday':model.birthday,
    'username': model.username,
    'password': model.password
      };
  }


}
