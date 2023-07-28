import 'package:web_schoolapp/data/models/add_date_model.dart';
import 'package:web_schoolapp/data/models/add_event_response_model.dart';
import 'package:web_schoolapp/data/models/home_model.dart';

abstract class WebHomeStates {}

class WebHomeInitState extends WebHomeStates {}

class WebHomeLoadingState extends WebHomeStates {}

class WebHomeSuccessfulState extends WebHomeStates {
  final HomeModel? homeModel;
  WebHomeSuccessfulState(this.homeModel);
}

class WebHomeErrorState extends WebHomeStates {
  final String error;
  WebHomeErrorState({required this.error});
}

class WebHomeNewDateLoadingState extends WebHomeStates {}

class WebHomeNewDateSuccessfulState extends WebHomeStates {
  final NewDateModel? newDateModel;
  WebHomeNewDateSuccessfulState(this.newDateModel);
}

class WebHomeNewDateErrorState extends WebHomeStates {
  final String error;
  WebHomeNewDateErrorState({required this.error});
}

//post announcement
class NewPostEventLoadingState extends WebHomeStates {}

class NewPostEventSuccessState extends WebHomeStates {
  final AddEventResponseModel? model;
  NewPostEventSuccessState(this.model);
}

class NewPostEventErrorState extends WebHomeStates {
  final String? error;
  NewPostEventErrorState(this.error);
}
