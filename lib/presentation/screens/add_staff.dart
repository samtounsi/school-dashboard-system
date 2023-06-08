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
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();

Uint8List? imageFile;
bool imageAvailable = false;

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'images/Staff.svg',
                      width: 600.0,
                      height: 600.0,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 170, end: 150, top: 50, bottom: 60),
                    child: Column(
                      children: [
                        Text(
                          'Add Staff',
                          style: TextStyle(
                              fontSize: 50, color: AppColors.lightOrange),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 100,
                      end: 150,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 50),
                            child: defaultformfeild(
                              controller: firstNameController,
                              type: TextInputType.name,
                              Width: 400,
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
                          Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 50),
                            child: defaultformfeild(
                              controller: lastNameController,
                              Width: 400,
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
                          Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 50),
                            child: defaultformfeild(
                              controller: genderController,
                              type: TextInputType.text,
                              labelTextColor: AppColors.lightOrange,
                              prefixColor: AppColors.lightOrange,
                              prefix: Icons.perm_identity_outlined,
                              Width: 400,
                              label: 'Gender',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 50),
                            child: defaultformfeild(
                              controller: phoneController,
                              Width: 400,
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
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
