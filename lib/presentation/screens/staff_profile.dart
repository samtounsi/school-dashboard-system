
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/staff_profile/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';

import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

import '../../business logic/cubits/staff_profile/cubit.dart';
import 'package:intl/intl.dart';

import '../../data/models/staffRegisterModel.dart';
import '../../data/models/staff_edit_profile_model.dart';

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController birthdayController = TextEditingController();
TextEditingController addressController = TextEditingController();

TextEditingController passwordController = TextEditingController();

TextEditingController usernameController= TextEditingController();


var formKey = GlobalKey<FormState>();

class StaffProfile extends StatelessWidget {
  String id;
  StaffProfile({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaffProfileCubit,StaffProfileStates>(
      listener: (context,state)
      {
          if(state is AppStaffWebStaffProfileSuccessState)
          {
            usernameController.text=state.staffProfileModel.username.toString();
            firstNameController.text=state.staffProfileModel.firstName.toString();
            lastNameController.text=state.staffProfileModel.lastName.toString();
            addressController.text=state.staffProfileModel.address.toString();
            genderController.text=state.staffProfileModel.gender.toString();
            phoneController.text=state.staffProfileModel.phoneNumber.toString();
            DateTime date=DateTime.parse(state.staffProfileModel.birthday!);
            String formattedDate =
                "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
            birthdayController.text = formattedDate;
          }

      },
      builder: (context,state)
      {
        var model =StaffProfileCubit.get(context).staffProfileModel;
        usernameController.text=model!.username.toString();
        firstNameController.text=model.firstName.toString();
        lastNameController.text=model.lastName.toString();
        addressController.text=model.address.toString();
        genderController.text=model.gender.toString();
        phoneController.text=model.phoneNumber.toString();
        DateTime date=DateTime.parse(model.birthday!);
        String formattedDate =
            "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
        birthdayController.text = formattedDate;
        return ConditionalBuilder(
          condition: StaffProfileCubit.get(context).staffProfileModel!=null ,
          builder:(context)
          {
            return Scaffold(
              body: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SafeArea(
                        child: Row(
                          children: [
                            SizedBox(width: 100),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'images/Staff.svg',
                                  width: 500.0,
                                  height: 500.0,
                                ),
                              ],
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                   ' ${model.firstName.toString()+' '+model.lastName.toString() }',
                                    style: TextStyle(
                                        fontSize: 50, color: AppColors.lightOrange),
                                  ),
                                  SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(bottom: 50),
                                        child: defaultformfeild(
                                          controller: firstNameController,
                                          type: TextInputType.name,
                                          Width: 250,
                                          label: 'FirstName',
                                          labelTextColor: AppColors.lightOrange,
                                          prefix: Icons.person,
                                          prefixColor: AppColors.lightOrange,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (!RegExp("([a-zA-Z]{3,30}\s*)+")
                                                .hasMatch(value!)) {
                                              return ' Enter correct name';
                                            }
                                            if (value!.length > 15) {
                                              return 'this name too long ';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(bottom: 50),
                                        child: defaultformfeild(
                                          controller: lastNameController,
                                          Width: 250,
                                          type: TextInputType.name,
                                          labelTextColor: AppColors.lightOrange,
                                          label: 'LastName',
                                          prefix: Icons.person,
                                          prefixColor: AppColors.lightOrange,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (!RegExp("([a-zA-Z]{3,30}\s*)+")
                                                .hasMatch(value!)) {
                                              return ' Enter correct name';
                                            }
                                            if (value!.length > 15) {
                                              return 'this name too long ';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(bottom: 50),
                                        child: defaultformfeild(
                                          controller: genderController,
                                          type: TextInputType.text,
                                          labelTextColor: AppColors.lightOrange,
                                          prefixColor: AppColors.lightOrange,
                                          prefix: Icons.perm_identity_outlined,
                                          Width: 250,
                                          label: 'Gender',
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(bottom: 50),
                                        child: defaultformfeild(
                                          controller: phoneController,
                                          Width: 250,
                                          type: TextInputType.phone,
                                          label: 'Phone Number',
                                          prefix: Icons.phone,
                                          prefixColor: AppColors.lightOrange,
                                          labelTextColor: AppColors.lightOrange,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                                .hasMatch(value!)) {
                                              return ' Enter correct number';
                                            }

                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      width: 600,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: TextField(
                                        controller: birthdayController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppColors.lightOrange,
                                                    width: 3)),
                                            icon: Icon(
                                              Icons.calendar_today,
                                              color: AppColors.lightOrange,
                                              size: 40,
                                            ),
                                            //icon of text field
                                            labelText: "Date of Birth",
                                            labelStyle: TextStyle(
                                              color: AppColors.lightOrange,
                                            ) //label text of field
                                        ),
                                        readOnly: true,
                                        //set it true, so that user will not able to edit text
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate:
                                              DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050))
                                              .then((value) {
                                            print(DateFormat.yMMMd()
                                                .format(value!));
                                            birthdayController.text =
                                                DateFormat.yMMMd()
                                                    .format(value);
                                          });
                                        },
                                      )),
                                  SizedBox(height: 50,),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColors.lightOrange,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 550,
                                        child: TextFormField(
                                          controller: addressController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "Detailed address",
                                            labelStyle: TextStyle(
                                              color: AppColors.lightOrange,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: AppColors.lightOrange,
                                                  width: 3,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 30,),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(bottom: 50),
                                        child: defaultformfeild(
                                          controller: usernameController,
                                          type: TextInputType.name,
                                          Width: 250,
                                          label: 'User Name',
                                          labelTextColor: AppColors.lightOrange,
                                          prefix: Icons.account_circle_outlined,
                                          prefixColor: AppColors.lightOrange,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            if (!RegExp("([a-zA-Z]{3,30}\s*)+")
                                                .hasMatch(value!)) {
                                              return ' Enter correct name';
                                            }
                                            if (value!.length > 25) {
                                              return 'this name too long ';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 50,),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(bottom: 50),
                                        child: defaultformfeild(
                                          Width: 250,
                                          controller: passwordController,
                                          type: TextInputType.text,
                                          ispassword:StaffProfileCubit.get(context).isPassword,
                                          suffix: StaffProfileCubit.get(context).suffix,
                                          suffixColor: AppColors.lightOrange,
                                          suffixpressed: () {
                                            StaffProfileCubit.get(context)
                                                .changePasswordVisibility();
                                          },
                                          label: 'Password',
                                          labelTextColor: AppColors.lightOrange,
                                          prefix: Icons.lock_outline,
                                          prefixColor: AppColors.lightOrange,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            } else if (value!.length < 8) {
                                              return 'At least 8 character';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ConditionalBuilder(
                                        condition: state is ! AppStaffWebStaffUpdateProfileLoadingState,
                                        builder:(context)=> defaultTextButton(
                                          text: 'Update',
                                          function: () {
                                            UpdateStaffModel model=UpdateStaffModel(
                                              id: id,
                                              firstName: firstNameController.text,
                                              lastName: lastNameController.text,
                                              address: addressController.text,
                                              phoneNumber: phoneController.text,
                                              gender: genderController.text,
                                              birthday: birthdayController.text,
                                              username: usernameController.text,
                                              password: passwordController.text
                                            );
                                            StaffProfileCubit.get(context).updateStaffProfile(data: model);
                                            print(model.toJson(model).toString());
                                          },
                                          isUpperCase: true,
                                          radius: 50,
                                          width: 400,
                                          height: 50,
                                          background: AppColors.lightOrange,
                                          textSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
