class StudentSortMessage{
  final String message;
  StudentSortMessage({required this.message});
  factory StudentSortMessage.fromJson(Map<String,dynamic>json)
  {
    return StudentSortMessage(message:json['message']);
  }
}