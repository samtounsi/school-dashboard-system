
import '../../../data/models/get_timetable_model.dart';
import '../../../data/models/show_sections.dart';

abstract class ShowTimetableStates {}

class  ShowTimetableInitialState extends  ShowTimetableStates{}
class ClassChangeClassState extends  ShowTimetableStates{}
class ClassChangeSectionState extends  ShowTimetableStates{}
class ClassGetTableSuccessState extends  ShowTimetableStates{}
class AppShowTimetableLoadingState extends ShowTimetableStates {}
class AppShowTimetableSuccessState extends ShowTimetableStates {

  final GetTimetableModel getTimetableModel;

  AppShowTimetableSuccessState(this.getTimetableModel);

}
class GetTimetableEmptyState extends ShowTimetableStates {

  final GetTimetableModel getTimetableModel;

  GetTimetableEmptyState(this.getTimetableModel);

}
class AppShowTimetableErrorState extends ShowTimetableStates {
  final error;

  AppShowTimetableErrorState({this.error});
}
class ShowSectionsLoadingState extends ShowTimetableStates{}
class ShowSectionsSuccessState extends ShowTimetableStates{
  final ShowSections showSections;

ShowSectionsSuccessState(this.showSections);

}
class ShowSectionsErrorState extends ShowTimetableStates {
  final error;

  ShowSectionsErrorState({this.error});
}