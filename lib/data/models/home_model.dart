class HomeModel {
  int? numberOfTeachers;
  int? numberOfStudents;
  int? numberOfAdmins;
  List<Holidays>? holidays;
  List<ExamDate>? examDate;
  List<RegisterDate>? registerDate;
  List<WorkDate>? workDate;
  String? message;

  HomeModel(
      {this.numberOfTeachers,
      this.numberOfStudents,
      this.numberOfAdmins,
      this.holidays,
      this.examDate,
      this.registerDate,
      this.workDate,
      this.message});

  HomeModel.fromJson(Map<String, dynamic> json) {
    numberOfTeachers = json['number_of_teachers'];
    numberOfStudents = json['number_of_students'];
    numberOfAdmins = json['number_of_admins'];
    if (json['holidays'] != null) {
      holidays = <Holidays>[];
      json['holidays'].forEach((v) {
        holidays!.add(new Holidays.fromJson(v));
      });
    }
    if (json['exam_date'] != null) {
      examDate = <ExamDate>[];
      json['exam_date'].forEach((v) {
        examDate!.add(new ExamDate.fromJson(v));
      });
    }
    if (json['register_date'] != null) {
      registerDate = <RegisterDate>[];
      json['register_date'].forEach((v) {
        registerDate!.add(new RegisterDate.fromJson(v));
      });
    }
    if (json['work_date'] != null) {
      workDate = <WorkDate>[];
      json['work_date'].forEach((v) {
        workDate!.add(new WorkDate.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_of_teachers'] = this.numberOfTeachers;
    data['number_of_students'] = this.numberOfStudents;
    data['number_of_admins'] = this.numberOfAdmins;
    if (this.holidays != null) {
      data['holidays'] = this.holidays!.map((v) => v.toJson()).toList();
    }
    if (this.examDate != null) {
      data['exam_date'] = this.examDate!.map((v) => v.toJson()).toList();
    }
    if (this.registerDate != null) {
      data['register_date'] =
          this.registerDate!.map((v) => v.toJson()).toList();
    }
    if (this.workDate != null) {
      data['work_date'] = this.workDate!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Holidays {
  String? type;
  String? name;
  DateTime? startDate;
  DateTime? endDate;

  Holidays({this.type, this.name, this.startDate, this.endDate});

  Holidays.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    startDate =DateTime.parse(json['start_date']);
    endDate =DateTime.parse(json['end_date']);
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

class ExamDate {
  String? type;
  String? name;
  DateTime? startDate;
  DateTime? endDate;

  ExamDate({this.type, this.name, this.startDate, this.endDate});

  ExamDate.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    startDate =DateTime.parse(json['start_date']);
    endDate =DateTime.parse(json['end_date']);
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

class RegisterDate {
  String? type;
  String? name;
  DateTime? startDate;
  DateTime? endDate;

  RegisterDate({this.type, this.name, this.startDate, this.endDate});

  RegisterDate.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    startDate =DateTime.parse(json['start_date']);
    endDate =DateTime.parse(json['end_date']);
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

class WorkDate {
  String? type;
  String? name;
  DateTime? startDate;
  DateTime? endDate;

  WorkDate({this.type, this.name, this.startDate, this.endDate});

  WorkDate.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    startDate =DateTime.parse(json['start_date']);
    endDate =DateTime.parse(json['end_date']);
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