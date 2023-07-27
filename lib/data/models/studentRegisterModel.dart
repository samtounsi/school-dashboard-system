//model for request add student
class RegisterModelStudent {
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String motherLastName;
  final String? grade;
  final String address;
  final String phoneNumber;
  final String parentNumber;
  final String telephoneNumber;
  final String? gender;
  final String gba;
  final String birthday;
  final String nationality;

  RegisterModelStudent({required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.motherLastName,
    required this.grade,
    required this.address,
    required this.nationality,
    required this.birthday,
    required this.gender,
    required this.gba,
    required this.parentNumber,
    required this.phoneNumber,
    required this.telephoneNumber});

  factory RegisterModelStudent.fromJson(Map<String, dynamic> json) {
    return RegisterModelStudent(
        firstName : json['first_name'],
        lastName :json['last_name'],
        fatherName : json['father_name'],
        motherName : json['mother_name'],
        motherLastName : json['mother_last_name'],
        grade :json['grade'],
        address :json['address'],
        nationality : json['nationality'],
        birthday : json['birthday'],
        gender : json['gender'],
        gba : json['GPA'],
        parentNumber : json['parent_number'],
        phoneNumber :json['phone_number'],
    telephoneNumber : json['telephone_number'],);
  }

}
