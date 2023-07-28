
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/staff_profile/states.dart';

import '../../../data/models/activate_user_model.dart';
import '../../../data/models/staffRegisterModel.dart';
import '../../../data/models/staff_edit_profile_model.dart';
import '../../../data/models/staff_profile_model.dart';
import 'package:http/http.dart'as http;

import '../../../presentation/components and constants/constants.dart';

class StaffProfileCubit extends Cubit<StaffProfileStates>
{
  StaffProfileCubit():super(StaffProfileInitialState());
  static StaffProfileCubit get(context)=>BlocProvider.of(context);

  StaffProfileModel? staffProfileModel;
  Future<StaffProfileModel?> showStaffProfile({required id,context})async
  {
   emit(AppStaffWebStaffProfileLoadingState());
    var headers = {
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('https://new-school-management-system.onrender.com/web/admin_profile/$id'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 201) {
      print(response.statusCode);
      staffProfileModel=StaffProfileModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(staffProfileModel?.message);
      emit(AppStaffWebStaffProfileSuccessState(staffProfileModel!));
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      print(jsonDecode(await response.stream.bytesToString())['message']);
      emit(AppStaffWebStaffProfileErrorState());
    }
    return staffProfileModel;
  }

  String? id;
  changeStaffProfileId(id)
  {
    this.id=id;
    emit(AppStaffWebStaffProfileIdState());
  }


  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;


  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(AppStaffWebProfileChangePasswordVisibilityState());
  }


  Future updateStaffProfile({required UpdateStaffModel data})async
  {
    emit(AppStaffWebStaffUpdateProfileLoadingState());
    try {
      const url ="https://new-school-management-system.onrender.com/web/update_admin_profile";
      final headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token'
      };
      final updatePS = {
        'id':data.id,
        'first_name':data.firstName,
        'last_name':data.lastName,
        'address': data.address,
        'phone_number' : data.phoneNumber,
        'gender': data.gender,
        'birthday':data.birthday,
        'username': data.username,
        'password': data.password
      };
      final jsonBody = jsonEncode(updatePS);
      final request =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);
      final Map<String, dynamic> json = jsonDecode(request.body);
      print(request.statusCode);
      print(json);
      if (request.statusCode == 201) {
        staffProfileModel = StaffProfileModel.fromJson(json);
        emit(AppStaffWebStaffUpdateProfileSuccessState(staffProfileModel!));
      } else {
        throw Exception(json['message'] ?? "an error");
      }
    } catch (e) {
      emit(AppStaffWebStaffUpdateProfileErrorState(error: e.toString()));
      print(e.toString());
    }
  }


}