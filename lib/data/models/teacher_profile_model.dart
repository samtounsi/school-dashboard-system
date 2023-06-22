class TeacherProfileModel {
  String? username;
  String? firstName;
  String? lastName;
  String? address;
  String? gender;
  String? phoneNumber;
  String? nationality;
  int? yearsOfExperience;
  String? birthday;
  List<String>? subjects;
  List<String>? classes;
  Null? photo;
  String? email;
  String? university;
  String? message;

  TeacherProfileModel(
      {this.username,
        this.firstName,
        this.lastName,
        this.address,
        this.gender,
        this.phoneNumber,
        this.nationality,
        this.yearsOfExperience,
        this.birthday,
        this.subjects,
        this.classes,
        this.photo,
        this.email,
        this.university,
        this.message});

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    nationality = json['nationality'];
    yearsOfExperience = json['years_of_experience'];
    birthday = json['birthday'];
    subjects = json['subjects'].cast<String>();
    classes = json['classes'].cast<String>();
    photo = json['photo'];
    email = json['email'];
    university = json['university'];
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
    data['nationality'] = this.nationality;
    data['years_of_experience'] = this.yearsOfExperience;
    data['birthday'] = this.birthday;
    data['subjects'] = this.subjects;
    data['classes'] = this.classes;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['university'] = this.university;
    data['message'] = this.message;
    return data;
  }
}
