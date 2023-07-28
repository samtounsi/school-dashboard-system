// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_admin.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_admin.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'dart:typed_data';

import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_student.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

import '../../data/models/staffRegisterModel.dart';


TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController birthdayController = TextEditingController();
TextEditingController addressController = TextEditingController();
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();
String staffGenderValue='male';

class AddStaff extends StatelessWidget {
  const AddStaff({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebSchoolCubit,WebSchoolStates>(
      listener: (context,state){
        if(state is WebSchoolAddStaffSuccessState)
        {
          navigateTo(context, UserNamePasswordScreen(registerModel: state.staffRegisterModel,));
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(state.staffRegisterModel.message.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.darkBlue,fontSize: 20,fontWeight: FontWeight.bold),),
                    )),
              ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          }
        }
        else if(state is WebSchoolAddStaffErrorState)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

              child: Container(
                  height: 50,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(state.error.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
            ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
      }
      ,
      builder: (context,state)
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
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Add Staff',
                                style: TextStyle(
                                    fontSize: 50, color: AppColors.lightOrange),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(start:50,),
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
                                    padding: EdgeInsetsDirectional.only(top:50,bottom: 50),
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
                                    padding:
                                    EdgeInsetsDirectional.only(start: 50),
                                    child:Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                          Border.all(color: Colors.grey),
                                          borderRadius:
                                          BorderRadius.circular(7)),
                                      child: DropdownButton(
                                        value: staffGenderValue,
                                        items: [
                                          //add items in the dropdown
                                          DropdownMenuItem(
                                            child: Text("male",style: TextStyle(color: AppColors.lightOrange),),
                                            value: "male",
                                          ),
                                          DropdownMenuItem(
                                              child: Text("female",style: TextStyle(color: AppColors.lightOrange)),
                                              value: "female"),
                                        ],
                                        onChanged: (value) {
                                          WebSchoolCubit.get(context)
                                              .changeStaffGender(value!);
                                          staffGenderValue =
                                              WebSchoolCubit.get(context)
                                                  .staffGenderValue;
                                        },
                                        icon: Padding(
                                          //Icon at tail, arrow bottom is default icon
                                            padding: EdgeInsets.only(
                                                left: 20, right: 10),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: AppColors.lightOrange,
                                            )),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.lightOrange),
                                        dropdownColor: Colors.white,
                                        padding: EdgeInsetsDirectional.only(start: 10),
                                        //dropdown background color
                                        underline: Container(),
                                        //remove underline
                                        isExpanded:
                                        true, //make true to make width 100%
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 50,),
                                  defaultformfeild(
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
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 50),
                                child: Container(
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
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2050))
                                            .then((value) {
                                          print(DateFormat('yyyy/MM/dd').format(value!));
                                          birthdayController.text =
                                              DateFormat('yyyy/MM/dd').format(value);
                                        });
                                      },
                                    )),
                              ),
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
                              SizedBox(height: 50,),
                              Column(
                                children: [
                                  ConditionalBuilder(
                                    condition: state is ! WebSchoolAddStaffLoadingState,
                                    builder:(context)=> defaultTextButton(
                                      text: 'SAVE',
                                      function: ()
                                      {
                                        if(formKey.currentState!.validate())
                                        {
                                          print(firstNameController.text);
                                          print(lastNameController.text);
                                          print(addressController.text);
                                          print(phoneController.text);
                                          print(staffGenderValue);
                                          print(birthdayController.text);
                                          StaffModel model=StaffModel(
                                            first_name: firstNameController.text,
                                            last_name: lastNameController.text,
                                            address: addressController.text,
                                            phone_number: phoneController.text,
                                            gender: WebSchoolCubit.get(context)
                                                .staffGenderValue,
                                            birthday: birthdayController.text,
                                      );
                                          WebSchoolCubit.get(context).postStaff(data : model);
                                          print(model.toJson(model).toString());
                                        }

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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
