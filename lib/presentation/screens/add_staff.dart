// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'dart:typed_data';

import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';


TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController birthdayController = TextEditingController();
TextEditingController addressController = TextEditingController();
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();


class AddStaff extends StatelessWidget {
  const AddStaff({super.key});

  @override
  Widget build(BuildContext context) {
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
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2050))
                                      .then((value) {
                                    print(DateFormat.yMMMd()
                                        .format(value!));
                                    birthdayController.text =
                                        DateFormat.yMMMd().format(value);
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
                              defaultTextButton(
                                text: 'SAVE',
                                function: () {
                                  navigateTo(context, UserNamePasswordScreen());
                                },
                                isUpperCase: true,
                                radius: 50,
                                width: 400,
                                height: 50,
                                background: AppColors.lightOrange,
                                textSize: 20,
                                fontWeight: FontWeight.bold,
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
  }
}
