import 'package:web_schoolapp/data/models/show_sections.dart';

import '../../../data/models/activate_user_model.dart';
import '../../../data/models/certificate_model.dart';
import '../../../data/models/show_staff.dart';
import '../../../data/models/staff_profile_model.dart';

abstract class WebStaffStates {}

class WebStaffInitState extends WebStaffStates {}

class WebStaffRailAppearState extends WebStaffStates {}

class AppStaffWebChangePasswordVisibilityState extends WebStaffStates {}
class AppStaffWebChangeActiveState extends WebStaffStates {}
class AppStaffWebStaffShowLoadingState extends WebStaffStates {}
class AppStaffWebStaffShowSuccessState extends WebStaffStates {

  final ShowStaffModel showStaffModel;

  AppStaffWebStaffShowSuccessState(this.showStaffModel);

}
class AppStaffWebStaffShowErrorState extends WebStaffStates {
  final error;

  AppStaffWebStaffShowErrorState({this.error});
}
class AppStaffWebStaffActiveLoadingState extends WebStaffStates {}
class AppStaffWebStaffActiveSuccessState extends WebStaffStates {
  final ActivateUserModel activateUserModel;
  AppStaffWebStaffActiveSuccessState(this.activateUserModel);

}
class AppStaffWebStaffActiveErrorState extends WebStaffStates {
  final error;

  AppStaffWebStaffActiveErrorState({this.error});
}



