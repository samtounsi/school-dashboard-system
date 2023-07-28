class AddEventModel {
  String? title;
  String? description;
  String? eventDate;
  String? eventTime;
  String? userId;

  AddEventModel(
      {this.title,
        this.description,
        this.eventDate,
        this.eventTime,
        this.userId});

  AddEventModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson(AddEventModel model) {
    return{
    'title':model.title,
    'description':model.description,
    'event_date': model.eventDate,
    'event_time': model.eventTime,
    'userId':model.userId
    };


  }
}
