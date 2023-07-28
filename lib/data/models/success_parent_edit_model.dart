//model for response api update profile Edit 
class ParentProfileEditModel {
  final String userNameParentEdit;
  final String nameParentEdit;

  ParentProfileEditModel({
    required this.userNameParentEdit,
    required this.nameParentEdit,
  });

  factory ParentProfileEditModel.fromJson(Map<String, dynamic> json) {
    return ParentProfileEditModel(
        userNameParentEdit: json['username'], nameParentEdit: json['name']);
  }
}
