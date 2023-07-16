class RegisterModelStudent {
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? motherLastName;
  String? grade;
  String? address;
  String? phoneNumber;
  String? parentNumber;
  String? telephoneNumber;
  String? gender;
  String? gba;
  String? birthday;
  String? nationality;

  RegisterModelStudent(
      {this.firstName,
      this.lastName,
      this.fatherName,
      this.motherName,
      this.motherLastName,
      this.grade,
      this.address,
      this.nationality,
      this.birthday,
      this.gender,
      this.gba,
      this.parentNumber,
      this.phoneNumber,
      this.telephoneNumber});

  RegisterModelStudent.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    motherLastName = json['mother_last_name'];
    grade = json['grade'];
    address = json['address'];
    nationality = json['nationality'];
    birthday = json['birthday'];
    gender = json['gender'];
    gba = json['GPA'];
    parentNumber = json['parent_number'];
    phoneNumber = json['phone_number'];
    telephoneNumber = json['telephone_number'];
  }

  Map<String, dynamic> toJson(RegisterModelStudent model) {
    return {
      'first_name': model.firstName,
      'last_name': model.lastName,
      'father_name': model.fatherName,
      'mother_name': model.motherName,
      'mother_last_name': model.motherLastName,
      'grade': model.grade,
      'address': model.address,
      'phone_number': model.phoneNumber,
      'parent_number': model.parentNumber,
      'telephone_number': model.telephoneNumber,
      'gender': model.gender,
      'GPA': model.gba,
      'birthday': model.birthday,
      'nationality': model.nationality,
    };
  }
}
