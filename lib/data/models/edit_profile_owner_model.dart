class EditProfileOwnerModel{
  final String usernameOwner;
  final String message;
  EditProfileOwnerModel({required this.usernameOwner, required this.message});
  factory EditProfileOwnerModel.fromJson(Map<String,dynamic>json)
  {
    return EditProfileOwnerModel(
        usernameOwner: json['username'],
        message: json['message']);
  }}