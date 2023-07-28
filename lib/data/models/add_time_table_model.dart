class AddTimeTable {
  String? grade;
  int? section;
  List<String>? sundayLessons;
  List<String>? mondayLessons;
  List<String>? tuesdayLessons;
  List<String>? wednesdayLessons;
  List<String>? thursdayLessons;
  String? englishTeacher;
  String? arabicTeacher;
  String? frenchTeacher;
  String? artTeacher;
  String? musicTeacher;
  String? sportsTeacher;
  String? scienceTeacher;
  String? technologyTeacher;
  String? mathTeacher;
  String? physicsTeacher;
  String? chemistryTeacher;
  String? socialTeacher;
  String? cultureTeacher;
  String? religionTeacher;
  String? philosophyTeacher;

  AddTimeTable(
      {this.grade,
        this.section,
        this.sundayLessons,
        this.mondayLessons,
        this.tuesdayLessons,
        this.wednesdayLessons,
        this.thursdayLessons,
        this.englishTeacher,
        this.arabicTeacher,
        this.frenchTeacher,
        this.artTeacher,
        this.musicTeacher,
        this.sportsTeacher,
        this.scienceTeacher,
        this.technologyTeacher,
        this.mathTeacher,
        this.physicsTeacher,
        this.chemistryTeacher,
        this.socialTeacher,
        this.cultureTeacher,
        this.religionTeacher,
        this.philosophyTeacher});

  AddTimeTable.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    section = json['section'];
    sundayLessons = json['sundayLessons'].cast<String>();
    mondayLessons = json['mondayLessons'].cast<String>();
    tuesdayLessons = json['tuesdayLessons'].cast<String>();
    wednesdayLessons = json['wednesdayLessons'].cast<String>();
    thursdayLessons = json['thursdayLessons'].cast<String>();
    englishTeacher = json['englishTeacher'];
    arabicTeacher = json['arabicTeacher'];
    frenchTeacher = json['frenchTeacher'];
    artTeacher = json['artTeacher'];
    musicTeacher = json['musicTeacher'];
    sportsTeacher = json['sportsTeacher'];
    scienceTeacher = json['scienceTeacher'];
    technologyTeacher = json['technologyTeacher'];
    mathTeacher = json['mathTeacher'];
    physicsTeacher = json['physicsTeacher'];
    chemistryTeacher = json['chemistryTeacher'];
    socialTeacher = json['socialTeacher'];
    cultureTeacher = json['cultureTeacher'];
    religionTeacher = json['religionTeacher'];
    philosophyTeacher = json['philosophyTeacher'];
  }

  Map<String, dynamic> toJson(AddTimeTable model) {

    return{
    'grade': model.grade,
    'section' : model.section,
    'sundayLessons':model.sundayLessons,
    'mondayLessons':model.mondayLessons,
    'tuesdayLessons' : model.tuesdayLessons,
    'wednesdayLessons':model.wednesdayLessons,
    'thursdayLessons' :model.thursdayLessons,
    'englishTeacher': model.englishTeacher,
    'arabicTeacher' : model.arabicTeacher,
    'frenchTeacher' :model.frenchTeacher,
    'artTeacher':model.artTeacher,
    'musicTeacher' :model.musicTeacher,
    'sportsTeacher':model.sportsTeacher,
    'scienceTeacher':model.scienceTeacher,
    'technologyTeacher' :model.technologyTeacher,
    'mathTeacher': model.mathTeacher,
    'physicsTeacher':model.physicsTeacher,
    'chemistryTeacher':model.chemistryTeacher,
    'socialTeacher':model.socialTeacher,
    'cultureTeacher':model.cultureTeacher,
    'religionTeacher':model.religionTeacher,
    'philosophyTeacher':model.philosophyTeacher
    };
  }
}
