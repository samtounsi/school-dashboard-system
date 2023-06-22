class StaffModel {
  String? first_name;
  String? last_name;
  String? address;
  String? phone_number;
  String? gender;
  String? birthday;

  StaffModel(
      {this.first_name,
        this.last_name,
        this.address,
        this.phone_number,
        this.gender,
        this.birthday});

  StaffModel.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    address = json['address'];
    phone_number = json['phone_number'];
    gender = json['gender'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson(StaffModel model) {
   return{ "first_name":model.first_name,
    "last_name":model.last_name,
    "address":model.address,
    "phone_number":model.phone_number,
    "gender":model.gender,
    "birthday":model.birthday};
  }
}
