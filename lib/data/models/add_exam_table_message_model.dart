class AddExamTableMessage{
  final String message;
  AddExamTableMessage({required this.message});
  factory AddExamTableMessage.fromJson(Map<String,dynamic>json)
  {
    return AddExamTableMessage(message:json['message']);
  }
}