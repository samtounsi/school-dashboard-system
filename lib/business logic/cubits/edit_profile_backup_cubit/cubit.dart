import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/edit_profile_backup_cubit/state.dart';
import 'package:http/http.dart' as http;
import 'package:web_schoolapp/data/models/backup_model.dart';
import 'package:web_schoolapp/data/models/edit_profile_owner_model.dart';
import '../../../presentation/components and constants/constants.dart';

class EditBackUpCubit extends Cubit<EditBackupState> {
  EditBackUpCubit() : super(InitialEditBackupState());

  static EditBackUpCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData iconDate = Icons.visibility;

  void changeVisiblePassword() {
    isPassword = !isPassword;
    iconDate = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordState());
  }
  EditProfileOwnerModel? editProfileOwnerModel;

  Future<void> editProfileOwner(
      String userNameOwner, String passwordOwner) async {
    emit(EditProfileOwnerLoading());
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://new-school-management-system.onrender.com/web/edit_owner'));
      request.fields.addAll({
        'username': userNameOwner,
        'password': passwordOwner,
      });
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      });
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);
      print(json);
      if(myResponse.statusCode==201)
        {
          editProfileOwnerModel=EditProfileOwnerModel.fromJson(json);
          emit(EditProfileOwnerSuccessState(editProfileOwnerModel!));
        }
    } catch (e) {
      emit(EditProfileOwnerError(e.toString()));
    }
  }
  BackupModel? backupModel;
  Future<void> backUp(String successAverage,String currentYear)
  async {
    emit(BackUpStateLoading());
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://new-school-management-system.onrender.com/web/backup'));
      request.fields.addAll({
        'success_avg':successAverage,
        'year_date':currentYear,
      });
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      });
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);
      print(json);
      if(myResponse.statusCode==200)
      {
        backupModel=BackupModel.fromJson(json);
        emit(BackUpStateSuccess(back: backupModel!));
      }
    } catch (e) {
      emit(BackUpStateError(e.toString()));
    }
  }
}
