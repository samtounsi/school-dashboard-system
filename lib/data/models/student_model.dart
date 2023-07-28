////model for response api search filter student
class StudentModel {
  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final int isActive;
  final String? section;

  StudentModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.section,
      required this.photo,
      required this.isActive});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      photo: json['photo'],
      section: json['section'],
      isActive: json['is_active'],
    );
  }
}
