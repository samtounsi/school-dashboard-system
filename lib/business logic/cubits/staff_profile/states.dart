
import 'package:flutter/material.dart';

import '../../../data/models/staff_profile_model.dart';

abstract class StaffProfileStates{}
class StaffProfileInitialState extends StaffProfileStates{}
class AppStaffWebProfileChangePasswordVisibilityState extends StaffProfileStates {}

class AppStaffWebStaffProfileIdState extends StaffProfileStates {}

class AppStaffWebStaffProfileLoadingState extends StaffProfileStates {}
class AppStaffWebStaffProfileSuccessState extends StaffProfileStates {
  StaffProfileModel staffProfileModel;

  AppStaffWebStaffProfileSuccessState(this.staffProfileModel);

}
class AppStaffWebStaffProfileErrorState extends StaffProfileStates {
  final error;

  AppStaffWebStaffProfileErrorState({this.error});
}
