class ExamTableSendModel {
  String? grade;
  int? semester;
  List<String>? first;
  List<String>? second;
  List<String>? third;
  List<String>? fourth;
  List<String>? fifth;
  List<String>? sixth;
  List<String>? seventh;
  List<String>? eighth;
  List<String>? ninth;
  List<String>? tenth;
  List<String>? eleventh;
  List<String>? twelfth;

  ExamTableSendModel({
    this.grade,
    this.semester,
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
    this.sixth,
    this.seventh,
    this.eighth,
    this.ninth,
    this.tenth,
    this.eleventh,
    this.twelfth,
  });

  ExamTableSendModel.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    semester = json['semester'];

    first = json['first'].cast<String>();
    second = json['second'].cast<String>();
    third = json['third'].cast<String>();
    fourth = json['fourth'].cast<String>();
    fifth = json['fifth'].cast<String>();
    sixth = json['sixth'];
    seventh = json['seventh'];
    eighth = json['eighth'];
    ninth = json['ninth'];
    tenth = json['tenth'];
    eleventh = json['eleventh'];
    twelfth = json['twelfth'];
  }

  Map<String, dynamic> toJson(ExamTableSendModel model) {
    return {
      'grade': model.grade,
      'semester': model.semester,
      'first': model.first,
      'second': model.second,
      'third': model.third,
      'fourth': model.fourth,
      'fifth': model.fifth,
      'sixth': model.sixth,
      'seventh': model.seventh,
      'eighth': model.eighth,
      'ninth': model.ninth,
      'tenth': model.tenth,
      'eleventh': model.eleventh,
      'twelfth': model.twelfth,
    };
  }
}
