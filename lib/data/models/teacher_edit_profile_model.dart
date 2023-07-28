class UpdateTeacherModel {
  int?id;
  String? firstName;
  String? lastName;
  String? address;
  String? phoneNumber;
  String? gender;
  String? birthday;
  String? yearsOfExperience;
  String? nationality;
  List<String>? subjects;
  String?university;
  String?email;
  String? userName;
  String? password;

  UpdateTeacherModel(
      {
        this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.phoneNumber,
        this.gender,
        this.birthday,
        this.yearsOfExperience,
        this.nationality,
        this.subjects,
        this.university,
        this.email,
        this.userName,
        this.password
      });

  UpdateTeacherModel.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    birthday = json['birthday'];
    yearsOfExperience = json['years_of_experience'];
    nationality = json['nationality'];
    subjects = json['subjects'].cast<String>();
    university=json['university'];
    email= json['email'];
    userName=json['username'];
    password=json['password'];
  }

  Map<String, dynamic> toJson(UpdateTeacherModel model) {
    return {
      'id':model.id,
      'first_name':model.firstName,
      'last_name':model.lastName,
      'address' : model.address,
      'phone_number': model.phoneNumber,
      'gender': model.gender,
      'birthday' : model.birthday,
      'years_of_experience' : model.yearsOfExperience,
      'nationality' : model.nationality,
      'subjects': model.subjects,
      'university':model.university,
      'email':model.email,
      'username':model.userName,
      'password':model.password
    };
  }
}
