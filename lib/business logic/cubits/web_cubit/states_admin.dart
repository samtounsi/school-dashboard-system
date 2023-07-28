import 'package:web_schoolapp/data/models/logout_model.dart';
import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:web_schoolapp/data/models/show_staff.dart';

abstract class WebSchoolStates {}

class WebSchoolInitState extends WebSchoolStates {}

//rail states
class WebSchoolRailAppearState extends WebSchoolStates {}

class WebSchoolChangeScreenState extends WebSchoolStates {}

//logout states
class AppLogoutLoadingState extends WebSchoolStates {}

class AppLogoutSuccessState extends WebSchoolStates {
  final LogoutModel logoutModel;
  AppLogoutSuccessState(this.logoutModel);
}

class AppLogoutErrorState extends WebSchoolStates {
  final String error;
  AppLogoutErrorState(this.error);
}
//staff states
class AppStaffWebChangeGenderState extends WebSchoolStates {}
class WebSchoolAddStaffSuccessState extends WebSchoolStates {
  final RegisterModel staffRegisterModel;

  WebSchoolAddStaffSuccessState(this.staffRegisterModel);

}
class WebSchoolAddStaffLoadingState extends WebSchoolStates {}
class WebSchoolAddStaffErrorState extends WebSchoolStates {
  final error;

  WebSchoolAddStaffErrorState({this.error});
}


