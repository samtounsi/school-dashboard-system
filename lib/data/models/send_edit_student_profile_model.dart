//model for request update student profile
class StudentProfileEditSendModel {
  final int id;
  final String userNameEditS;
  final String firstNameEditS;
  final String lastNameEditS;
  final String fatherNameEditS;
  final String motherNameEditS;
  final String motherLastNameEditS;
  final String telephoneNumberEditS;
  final String gbaEditS;
  final String addressEditS;
  final String genderEditS;
  final String phoneNumberEditS;
  final String nationalityEditS;
  final String birthdayEditS;
  final String gradeNameEditS;
  final String classNameEditS;
  final String parentPhoneNumberEditS;
  final String? passwordEditS;

  StudentProfileEditSendModel({
    required this.id,
    required this.userNameEditS,
    required this.firstNameEditS,
    required this.lastNameEditS,
    required this.fatherNameEditS,
    required this.motherNameEditS,
    required this.motherLastNameEditS,
    required this.telephoneNumberEditS,
    required this.gbaEditS,
    required this.addressEditS,
    required this.genderEditS,
    required this.phoneNumberEditS,
    required this.nationalityEditS,
    required this.birthdayEditS,
    required this.gradeNameEditS,
    required this.classNameEditS,
    required this.parentPhoneNumberEditS,
    this.passwordEditS,
  });
}
