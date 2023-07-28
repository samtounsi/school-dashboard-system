class NewDateModel {
  String? type;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  String? message;

  NewDateModel({
    this.type,
    this.name,
    this.startDate,
    this.endDate,
    this.message,
  });

  NewDateModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    startDate = DateTime.parse(json['start_date']);
    endDate = DateTime.parse(json['end_date']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
