import 'package:web_schoolapp/data/models/backup_model.dart';
import 'package:web_schoolapp/data/models/edit_profile_owner_model.dart';

abstract class EditBackupState {}

class InitialEditBackupState extends EditBackupState {}

class ChangePasswordState extends EditBackupState {}

class EditProfileOwnerSuccessState extends EditBackupState {
  EditProfileOwnerModel e;

  EditProfileOwnerSuccessState(this.e);
}

class EditProfileOwnerLoading extends EditBackupState {}

class EditProfileOwnerError extends EditBackupState {
  final String error;

  EditProfileOwnerError(this.error);
}

class BackUpStateSuccess extends EditBackupState {
  BackupModel back;
  BackUpStateSuccess({required this.back});
}

class BackUpStateLoading extends EditBackupState {}

class BackUpStateError extends EditBackupState {
  final String error;

  BackUpStateError(this.error);
}
