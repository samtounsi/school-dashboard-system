class CertificateModel {
  List<FirstSemester>? firstSemester;
  List<SecondSemester>? secondSemester;
  String? message;

  CertificateModel({this.firstSemester, this.secondSemester, this.message});

  CertificateModel.fromJson(Map<String, dynamic> json) {
    if (json['first_semester'] != null) {
      firstSemester = <FirstSemester>[];
      json['first_semester'].forEach((v) {
        firstSemester!.add(new FirstSemester.fromJson(v));
      });
    }
    if (json['second_semester'] != null) {
      secondSemester = <SecondSemester>[];
      json['second_semester'].forEach((v) {
        secondSemester!.add(new SecondSemester.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstSemester != null) {
      data['first_semester'] =
          this.firstSemester!.map((v) => v.toJson()).toList();
    }
    if (this.secondSemester != null) {
      data['second_semester'] =
          this.secondSemester!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class FirstSemester {
  String? subject;
  Mark? marks;
  late final totalMark;

  FirstSemester({this.subject, this.marks, this.totalMark});

  FirstSemester.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    marks = json['marks'] != null ? new Mark.fromJson(json['marks']) : null;
    totalMark = json['total_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    if (this.marks != null) {
      data['marks'] = this.marks!.toJson();
    }
    data['total_mark'] = this.totalMark;
    return data;
  }
}
class SecondSemester {
  String? subject;
  Marks? marks;
  late final totalMark;

  SecondSemester({this.subject, this.marks, this.totalMark});

  SecondSemester.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    marks = json['marks'] != null ? new Marks.fromJson(json['marks']) : null;
    totalMark = json['total_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    if (this.marks != null) {
      data['marks'] = this.marks!.toJson();
    }
    data['total_mark'] = this.totalMark;
    return data;
  }
}

class Mark {
  late final midMarkFirstSemester;
  late final finalMarkFirstSemester;
  late final quizPrizeFirstSemester;

  Mark(
      {this.midMarkFirstSemester,
        this.finalMarkFirstSemester,
        this.quizPrizeFirstSemester});

  Mark.fromJson(Map<String, dynamic> json) {
    midMarkFirstSemester = json['mid_mark_first_semester'];
    finalMarkFirstSemester = json['final_mark_first_semester'];
    quizPrizeFirstSemester = json['quiz_prize_first_semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid_mark_first_semester'] = this.midMarkFirstSemester;
    data['final_mark_first_semester'] = this.finalMarkFirstSemester;
    data['quiz_prize_first_semester'] = this.quizPrizeFirstSemester;
    return data;
  }
}

class Marks {
  late final midMarkSecondSemester;
  late final finalMarkSecondSemester;
  late final quizPrizeSecondSemester;

  Marks(
      {this.midMarkSecondSemester,
        this.finalMarkSecondSemester,
        this.quizPrizeSecondSemester});

  Marks.fromJson(Map<String, dynamic> json) {
    midMarkSecondSemester = json['mid_mark_second_semester'];
    finalMarkSecondSemester = json['final_mark_second_semester'];
    quizPrizeSecondSemester = json['quiz_prize_second_semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid_mark_second_semester'] = this.midMarkSecondSemester;
    data['final_mark_second_semester'] = this.finalMarkSecondSemester;
    data['quiz_prize_second_semester'] = this.quizPrizeSecondSemester;
    return data;
  }
}
