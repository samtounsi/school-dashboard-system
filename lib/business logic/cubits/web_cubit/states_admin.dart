import 'package:web_schoolapp/data/models/registerModel.dart';
import 'package:web_schoolapp/data/models/show_staff.dart';

abstract class WebSchoolStates {}

class WebSchoolInitState extends WebSchoolStates {}

class WebSchoolRailAppearState extends WebSchoolStates {}


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


