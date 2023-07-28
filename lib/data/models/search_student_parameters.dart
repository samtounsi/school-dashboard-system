//model for request api search filter student
class SearchStudentParameters {
  final String? grade;
  final String? section;
  final String? name;
  final bool isActive;

  SearchStudentParameters({
    this.grade,
    this.section,
    this.name,
    required this.isActive,
  });
}
