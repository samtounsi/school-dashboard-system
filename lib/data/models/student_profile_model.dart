class StudentProfileModel {
  final String userName;//
  final String firstName;//
  final String lastName;//
  final String fatherName;//
  final String motherName;//
  final String motherLastName;//
  final String telephoneNumber;//
  final double gba;
  final String address;//
  final String gender;//
  final String phoneNumber;//
  final String nationality;
  final String birthday;//
  final String gradeName;//
  final String className;//
  final String parentPhoneNumber;//
  final String? photo;
  final List<DateTime> absences;//
  final String? bio;
  final String? message;

  StudentProfileModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.motherLastName,
    required this.telephoneNumber,
    required this.gba,
    required this.address,
    required this.gender,
    required this.phoneNumber,
    required this.nationality,
    required this.birthday,
    required this.gradeName,
    required this.className,
    required this.parentPhoneNumber,
    this.photo,
    required this.absences,
    this.bio,

    this.message
  });

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileModel(
      userName: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fatherName: json['father_name'],
      motherName: json['mother_name'],
      motherLastName: json['mother_last_name'],
      telephoneNumber: json['telephone_number'],
      gba: json['GPA'],
      address: json['address'],
      gender: json['gender'],
      phoneNumber: json['phone_number'],
      nationality: json['nationality'],
      birthday: json['birthday'],
      gradeName: json['grade_name'],
      className: json['class_name'],
      parentPhoneNumber: json['parent_phone_number'],
      photo: json['photo'],
      absences: (json['absences'] as List).map((e) =>DateTime.parse(e)).toList(),
      // marks: (json['marks'] as List).map((e)=> e.toString()).toList(),
      bio: json['bio']
    );
  }
}