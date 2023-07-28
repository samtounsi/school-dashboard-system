import 'package:web_schoolapp/data/models/home_model.dart';

abstract class WebHomeStaffStates {}

class GetStaffHomeDataInitState extends WebHomeStaffStates {}

class GetStaffHomeDataLoadingState extends WebHomeStaffStates {}

class GetStaffHomeDataSuccessState extends WebHomeStaffStates {
  final HomeModel? homeSmodel;
  GetStaffHomeDataSuccessState(this.homeSmodel);
}

class GetStaffHomeDataErrorState extends WebHomeStaffStates {
  final String? error;
  GetStaffHomeDataErrorState(this.error);
}
