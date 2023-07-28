//model for api get feedback
class FeedBackModel{
  final String author;
  final String feedback;
  FeedBackModel({required this.author,required this.feedback});
  factory FeedBackModel.fromJson(Map<String,dynamic>json)
  {
    return FeedBackModel(author:json['author'], feedback: json['feedback']);
  }

}