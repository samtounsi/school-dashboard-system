// ignore_for_file: depend_on_referenced_packages, must_be_immutable, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';

import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/layouts/layout1.dart';
import 'package:web_schoolapp/presentation/screens/students_marks.dart';




class StudentProfile extends StatefulWidget {

  StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  TextEditingController dateOfBirth = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController telephoneController = TextEditingController();

  TextEditingController motherNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController classController = TextEditingController();

  TextEditingController birthdayController = TextEditingController();

  TextEditingController parentNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController= TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  Uint8List? imageFile;
  bool imageAvailable = false;

  bool isBottomSheetShown = false;

  String genderValue = 'male';

  String gradeValue = '7th grade';

  final List<String> gender = ['male', 'female'];

  final grades = [
    '7th grade',
    '8th grade',
    '9th grade',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit,DashBoardState>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.aqua,
            toolbarHeight: 70,
            elevation: 0.0,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 15,
                top: 15,
              ),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            title: Text(
              'Teacher\'s profile',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 15,
                  top: 15,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: AppColors.aqua,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'images/Raisinghand_rafikiAqua.svg',
                              width: 400.0,
                              height: 400.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(horizontal: 310),
                            child: Container(
                              width: 200.0,
                              height: 200,
                              child: Column(
                                children: [
                                  uploadAvatar(context),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    defaultformfeild(
                                      controller: firstNameController,
                                      type: TextInputType.name,
                                      label: 'FirstName',
                                      prefix: Icons.person,
                                      prefixColor: AppColors.aqua,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: lastNameController,
                                        type: TextInputType.name,
                                        label: 'LastName',
                                        prefix: Icons.person,
                                        prefixColor: AppColors.aqua,
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
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: classController,
                                        type: TextInputType.text,
                                        prefix: Icons.person,
                                        label: "Father's Name",
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'This field is required';
                                          }
                                          if (!RegExp("([a-zA-Z]{3,30}\s*)+")
                                              .hasMatch(value!)) {
                                            return ' Enter correct name';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    defaultformfeild(
                                      controller: motherNameController,
                                      type: TextInputType.text,
                                      prefix: Icons.person,
                                      label: "Mother's Name",
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: lastNameController,
                                        type: TextInputType.name,
                                        label: 'Gender',
                                        prefixColor: AppColors.aqua,
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
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: lastNameController,
                                        type: TextInputType.name,
                                        label: 'class',
                                        prefix: Icons.class_,
                                        prefixColor: AppColors.aqua,
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
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 850,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: TextField(
                                      controller: dateOfBirth,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: Color(0xFF3A968E),
                                            size: 40,
                                          ),
                                          //icon of text field
                                          labelText: "Date of Birth",
                                          labelStyle: TextStyle(
                                            color: Color(0xFFA6CDCA),
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
                                          print(DateFormat.yMMMd().format(value!));
                                          dateOfBirth.text =
                                              DateFormat.yMMMd().format(value);
                                        });
                                      },
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    defaultformfeild(
                                      controller: phoneController,
                                      type: TextInputType.number,
                                      prefix: Icons.phone_android,
                                      label: 'phone number',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: telephoneController,
                                        type: TextInputType.number,
                                        label: 'telephone number',
                                        prefix: Icons.phone,
                                        prefixColor: AppColors.aqua,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'This field is required';
                                          }
                                          if (value!.isEmpty) {
                                            return 'This field is required';
                                          }
                                          if (!RegExp(r'(^(?:[+0]9)?[0-9]{7}$)')
                                              .hasMatch(value!)) {
                                            return ' Enter correct number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: parentNumberController,
                                        type: TextInputType.number,
                                        label: "parent number",
                                        prefix: Icons.phone_android,
                                        prefixColor: AppColors.aqua,
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
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xFF3A968E),
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 800,
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
                                            color: Color(0xFFA6CDCA),
                                          ),
                                          focusColor: Colors.purple,
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
                                   Padding(
                                     padding: EdgeInsetsDirectional.only(bottom: 50),
                                     child: defaultformfeild(
                                       controller: usernameController,
                                       type: TextInputType.name,
                                       Width: 400,
                                       label: 'User Name',
                                       prefix: Icons.account_circle_outlined,
                                       prefixColor: AppColors.aqua,
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
                                       Width: 400,
                                       controller: passwordController,
                                       type: TextInputType.text,
                                       ispassword: StudentCubit.get(context).isPassword,
                                       suffix: StudentCubit.get(context).suffix,
                                       suffixpressed: () {
                                         StudentCubit.get(context)
                                             .changePasswordVisibility();
                                       },
                                       label: 'Password',
                                       prefix: Icons.lock_outline,
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
                                   SizedBox(
                                     height: 50,
                                   ),
                                 ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      defaultTextButton(
                        text: 'Show Marks',
                        function: () {
                          navigateTo(context, ShowStudentsMarks());
                        },
                        isUpperCase: true,
                        radius: 50,
                        width: 380,
                        height: 50,
                        background: AppColors.lightOrange,
                        textSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      defaultTextButton(
                        text: 'UPDATE',
                        function: () {},
                        isUpperCase: true,
                        radius: 50,
                        width: 380,
                        height: 50,
                        background: AppColors.aqua,
                        textSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      defaultTextButton(
                        text: 'Show Attendance',
                        function: () {

                        },
                        isUpperCase: true,
                        radius: 50,
                        width: 380,
                        height: 50,
                        background: AppColors.darkBlue,
                        textSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget uploadAvatar(context) => Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      CircleAvatar(
        radius: 80.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.white,
          backgroundImage: imageFile == null
              ? AssetImage("images/profile.png",)
              : MemoryImage(Uint8List.fromList(imageFile!))
          as ImageProvider,

          //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
        ),
      ),
      GestureDetector(
        onTap: () async {
          var image = await ImagePickerWeb.getImageAsBytes();
          setState(() {
            imageFile = image!;
            imageAvailable = true;
          });
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              bottom: 3
          ),
          child: Container(
            child: CircleAvatar(
              radius: 17,
              backgroundColor: AppColors.backgroundcolor,
              child: Icon(
                Icons.edit,
                color: AppColors.aqua,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
