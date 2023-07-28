//model for request update parent profile

class ParentProfileEditSendModel {
  final String userNameParentEditS;
  final String nameParentEditS;
  final String? passwordParentEditS;
  final String idParentEdit;

  ParentProfileEditSendModel({
    required this.userNameParentEditS,
    required this.nameParentEditS,
    this.passwordParentEditS,
    required this.idParentEdit,
  });
}
