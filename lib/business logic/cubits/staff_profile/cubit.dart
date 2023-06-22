
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/staff_profile/states.dart';

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

}