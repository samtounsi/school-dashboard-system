import 'package:web_schoolapp/data/models/add_timetable_response_model.dart';
import 'package:web_schoolapp/data/models/teacher_subject_model.dart';


import '../../../data/models/show_sections.dart';

abstract class TimetableStates{}
class TimetableInitialState extends TimetableStates{}
class TimetableChangeClassState extends TimetableStates{}
class TimetableChangeSectionState extends TimetableStates{}
class TimetableChangeArabicTeacherState extends TimetableStates{}
class TimetableChangeEnglishTeacherState extends TimetableStates{}
class TimetableChangeFrenchTeacherState extends TimetableStates{}
class TimetableChangeMathTeacherState extends TimetableStates{}
class TimetableChangePhysicsTeacherState extends TimetableStates{}
class TimetableChangeChemistryTeacherState extends TimetableStates{}
class TimetableChangeArtTeacherState extends TimetableStates{}
class TimetableChangeMusicTeacherState extends TimetableStates{}
class TimetableChangeSportsTeacherState extends TimetableStates{}
class TimetableChangeSocialTeacherState extends TimetableStates{}
class TimetableChangeCultureTeacherState extends TimetableStates{}
class TimetableChangeReligionTeacherState extends TimetableStates{}
class TimetableChangePhilosophyTeacherState extends TimetableStates{}
class TimetableChangeScienceTeacherState extends TimetableStates{}
class TimetableChangeTechnologyTeacherState extends TimetableStates{}

class AppShowSectionsLoadingState extends TimetableStates {}
class AppShowSectionsSuccessState extends TimetableStates {

  final ShowSections showSections;

  AppShowSectionsSuccessState(this.showSections);

}
class AppShowSectionsErrorState extends TimetableStates {
  final error;

  AppShowSectionsErrorState({this.error});
}


class AppShowTeachersSubjectsLoadingState extends TimetableStates {}
class AppShowTeachersSubjectsSuccessState extends TimetableStates {

  final TeacherSubjectModel showSubjectTeacher;

  AppShowTeachersSubjectsSuccessState(this.showSubjectTeacher);

}
class AppShowTeachersSubjectsErrorState extends TimetableStates {
  final error;

  AppShowTeachersSubjectsErrorState({this.error});
}



class AppAddTimetableLoadingState extends TimetableStates {}
class AppAddTimetableSuccessState extends TimetableStates {

  final AddTimetableResponse addTimetableResponse;

  AppAddTimetableSuccessState(this.addTimetableResponse);

}
class AppAddTimetableErrorState extends TimetableStates {
  final error;

  AppAddTimetableErrorState({this.error});
}


