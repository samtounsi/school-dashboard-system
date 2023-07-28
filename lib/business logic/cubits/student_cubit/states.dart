import '../../../data/models/certificate_model.dart';

abstract class DashBoardState{}
class InitialState extends DashBoardState{}
class ChangeGradeState extends DashBoardState{}
class ChangeSectionState extends DashBoardState{}
class ChangeDateBirth extends DashBoardState{}
class EditState extends DashBoardState{}
class SearchFilteredState extends DashBoardState{}
class AllDataState extends DashBoardState{}
class ChangeGenderState extends DashBoardState{}
class StudentSectionState extends DashBoardState{}
class ToggleState extends DashBoardState{}
class StudentChangePasswordVisibilityState extends DashBoardState{}
class ActiveState extends DashBoardState{}

class AppStaffWebGetCertificateLoadingState extends DashBoardState {}
class AppStaffWebGetCertificateSuccessState extends DashBoardState {

  final CertificateModel certificateModel;

  AppStaffWebGetCertificateSuccessState(this.certificateModel);

}
class AppStaffWebGetCertificateErrorState extends DashBoardState {
  final error;

  AppStaffWebGetCertificateErrorState({this.error});
}
