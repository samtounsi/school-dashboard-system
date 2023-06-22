class RegisterModelTeacher {
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

  RegisterModelTeacher(
      {this.firstName,
        this.lastName,
        this.address,
        this.phoneNumber,
        this.gender,
        this.birthday,
        this.yearsOfExperience,
        this.nationality,
        this.subjects,
        this.university,
        this.email
      });

  RegisterModelTeacher.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson(RegisterModelTeacher model) {
  return {
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
    'email':model.email
   };
  }
}
