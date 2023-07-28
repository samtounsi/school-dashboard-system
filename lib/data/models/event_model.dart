class EventModel {
  List<Events>? events;
  String? message;

  EventModel({this.events, this.message});

  EventModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Events {
  int? id;
  String? eventTime;
  String? eventDate;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? userId;

  Events(
      {this.id,
        this.eventTime,
        this.eventDate,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.userId});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventTime = json['event_time'];
    eventDate = json['event_date'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_time'] = this.eventTime;
    data['event_date'] = this.eventDate;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['userId'] = this.userId;
    return data;
  }
}
