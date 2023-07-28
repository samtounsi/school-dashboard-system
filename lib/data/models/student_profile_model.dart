//model for api get student profile
class StudentProfileModel {
  final int id;
  final String type;
  final String userName; //
  final String firstName; //
  final String lastName; //
  final String fatherName; //
  final String motherName; //
  final String motherLastName; //
  final String telephoneNumber; //
  final double gba;
  final String address; //
  final String gender; //
  final String phoneNumber; //
  final String nationality;
  final String birthday; //
  final String gradeName; //
  final String className; //
  final String parentPhoneNumber; //
  final String photo;
  final String photoUrlParent;
  final List<DateTime> absences; //
  final String? bio;
  final int parentId;
  final String parentUsername;
  final String parentName;
  final String? message;

  StudentProfileModel(
      {required this.type,
      required this.id,
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
      required this.photo,
      required this.photoUrlParent,
      required this.absences,
      this.bio,
      required this.parentId,
      required this.parentUsername,
      required this.parentName,
      this.message});

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) {
    return StudentProfileModel(
      type: json['type'],
      id: json['id'],
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
      photoUrlParent: json['photoUrl_parent'],
      absences:
          (json['absences'] as List).map((e) => DateTime.parse(e)).toList(),
      // marks: (json['marks'] as List).map((e)=> e.toString()).toList(),
      bio: json['bio'],
      parentId: json['parent_id'],
      parentUsername: json['parent_username'],
      parentName: json['parent_name'],
    );
  }
}
