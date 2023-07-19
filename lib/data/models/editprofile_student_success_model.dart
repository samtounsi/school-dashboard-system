class StudentProfileEditModel {
  final String userNameEdit;
  final String firstNameEdit;
  final String lastNameEdit;
  final String fatherNameEdit;
  final String motherNameEdit;
  final String motherLastNameEdit;
  final String telephoneNumberEdit;
  final String gbaEdit;
  final String addressEdit;
  final String genderEdit;
  final String phoneNumberEdit;
  final String nationalityEdit;
  final String birthdayEdit;
  final String gradeNameEdit;
  final String classNameEdit;
  final String parentPhoneNumberEdit;
  final String? bioEdit;
  final String message;

  StudentProfileEditModel(
      {required this.userNameEdit,
      required this.firstNameEdit,
      required this.lastNameEdit,
      required this.fatherNameEdit,
      required this.motherNameEdit,
      required this.motherLastNameEdit,
      required this.telephoneNumberEdit,
      required this.gbaEdit,
      required this.addressEdit,
      required this.genderEdit,
      required this.phoneNumberEdit,
      required this.nationalityEdit,
      required this.birthdayEdit,
      required this.gradeNameEdit,
      required this.classNameEdit,
      required this.parentPhoneNumberEdit,
      this.bioEdit,
      required this.message});

  factory StudentProfileEditModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileEditModel(
        userNameEdit: json['username'],
        firstNameEdit: json['first_name'],
        lastNameEdit: json['last_name'],
        fatherNameEdit: json['father_name'],
        motherNameEdit: json['mother_name'],
        motherLastNameEdit: json['mother_last_name'],
        telephoneNumberEdit: json['telephone_number'],
        gbaEdit: json['GPA'],
        addressEdit: json['address'],
        genderEdit: json['gender'],
        phoneNumberEdit: json['phone_number'],
        nationalityEdit: json['nationality'],
        birthdayEdit: json['birthday'],
        gradeNameEdit: json['grade_name'],
        classNameEdit: json['class_name'],
        parentPhoneNumberEdit: json['parent_phone_number'],
        bioEdit: json['bio'],
        message: json['message']);
  }
}
