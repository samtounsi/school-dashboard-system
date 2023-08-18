class BackupModel{
  final String message;
  BackupModel({required this.message});
  factory BackupModel.fromJson(Map<String,dynamic>json)
  {
    return BackupModel(message: json['message']);
  }
}