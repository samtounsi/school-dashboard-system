// ignore_for_file: unused_import, depend_on_referenced_packages, prefer_const_constructors, sized_box_for_whitespace, avoid_print, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';

import 'dart:typed_data';

import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

import '../components and constants/components.dart';

TextEditingController dateOfBirth = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController nationalityController = TextEditingController();
TextEditingController universityController = TextEditingController();
TextEditingController experienceYearsController = TextEditingController();
TextEditingController subjectController = TextEditingController();
TextEditingController classController = TextEditingController();
TextEditingController birthdayController = TextEditingController();
TextEditingController salaryController = TextEditingController();
var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();

Uint8List? imageFile;
bool imageAvailable = false;

String classValue = '7th grade';
String sectionValue = 'section 1';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTeacherWebCubit, AppTeacherWebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Add Teacher',
                    style: TextStyle(fontSize: 50, color: AppColors.darkBlue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/TeacherStudent.svg',
                        width: 550.0,
                        height: 550.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 310),
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
                                      prefixColor: AppColors.darkBlue,
                                      labelTextColor: AppColors.darkBlue,
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
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: lastNameController,
                                        type: TextInputType.name,
                                        prefixColor: AppColors.darkBlue,
                                        labelTextColor: AppColors.darkBlue,
                                        label: 'LastName',
                                        prefix: Icons.person,
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
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: classController,
                                        type: TextInputType.text,
                                        prefix: Icons.perm_identity_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        labelTextColor: AppColors.darkBlue,
                                        label: 'Gendre',
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'This field is required';
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
                                      controller: subjectController,
                                      type: TextInputType.text,
                                      prefix: Icons.home,
                                      prefixColor: AppColors.darkBlue,
                                      labelTextColor: AppColors.darkBlue,
                                      label: 'Nationality',
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
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: universityController,
                                        type: TextInputType.name,
                                        label: 'University',
                                        prefix: Icons.school_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        labelTextColor: AppColors.darkBlue,
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
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: experienceYearsController,
                                        type: TextInputType.number,
                                        prefix: Icons.work_history_outlined,
                                        labelTextColor: AppColors.darkBlue,
                                        prefixColor: AppColors.darkBlue,
                                        label: 'Years Of Experience',
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'This field is required';
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
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.darkBlue,
                                                  width: 3)),
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: AppColors.darkBlue,
                                            size: 40,
                                          ),
                                          //icon of text field
                                          labelText: "Date of Birth",
                                          labelStyle: TextStyle(
                                            color: AppColors.darkBlue,
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
                                      controller: subjectController,
                                      type: TextInputType.text,
                                      prefix: Icons.subject_outlined,
                                      prefixColor: AppColors.darkBlue,
                                      labelTextColor: AppColors.darkBlue,
                                      label: 'Subject',
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
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        width: 250,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: DropdownButton(
                                          value: classValue,
                                          items: [
                                            //add items in the dropdown
                                            DropdownMenuItem(
                                              child: Text("7th grade"),
                                              value: "7th grade",
                                            ),
                                            DropdownMenuItem(
                                                child: Text("8th grade"),
                                                value: "8th grade"),
                                            DropdownMenuItem(
                                              child: Text("9th grade"),
                                              value: "9th grade",
                                            )
                                          ],
                                          onChanged: (value) {
                                            AppTeacherWebCubit.get(context)
                                                .changeClass(value!);
                                            classValue =
                                                AppTeacherWebCubit.get(context)
                                                    .value;
                                          },
                                          icon: Padding(
                                              //Icon at tail, arrow bottom is default icon
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 10),
                                              child: Icon(
                                                Icons.arrow_drop_down,
                                                color: AppColors.darkBlue,
                                              )),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.darkBlue),
                                          dropdownColor: Colors.white,
                                          //dropdown background color
                                          underline: Container(),
                                          //remove underline
                                          isExpanded:
                                              true, //make true to make width 100%
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: salaryController,
                                        type: TextInputType.number,
                                        label: 'Salary',
                                        labelTextColor: AppColors.darkBlue,
                                        prefix: Icons.attach_money_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'This field is required';
                                          }
                                          if (!RegExp(
                                                  r'(^(?:[+0]9)?[0-9]{10}$)')
                                              .hasMatch(value!)) {
                                            return ' Enter correct salary';
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
                                      color: AppColors.darkBlue,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 800,
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
                                            color: AppColors.darkBlue,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 3,
                                          )),
                                        ),
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
                                      controller: phoneController,
                                      type: TextInputType.phone,
                                      label: 'Phone Number',
                                      labelTextColor: AppColors.darkBlue,
                                      prefix: Icons.phone,
                                      prefixColor: AppColors.darkBlue,
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
                                      padding:
                                          EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        Width: 550,
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        label: 'Email Address',
                                        labelTextColor: AppColors.darkBlue,
                                        prefix: Icons.email_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'This field is required';
                                          }
                                          if (value!.length > 320) {
                                            return 'this email is not correct';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 230, end: 150),
                                  child: defaultTextButton(
                                    text: 'SAVE',
                                    function: () {
                                      navigateTo(
                                          context, UserNamePasswordScreen());
                                    },
                                    isUpperCase: true,
                                    radius: 50,
                                    width: 380,
                                    height: 50,
                                    background:
                                        Color.fromARGB(255, 56, 108, 180),
                                    textSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  DropdownMenuItem<Object> buildClassItem({String? item}) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget uploadAvatar(context) => CircleAvatar(
        radius: 80.0,
        backgroundColor: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white,
              backgroundImage: imageFile == null
                  ? AssetImage('images/profile.png')
                  : MemoryImage(Uint8List.fromList(imageFile!))
                      as ImageProvider,

              //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
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
                  bottom: 3,
                  end: 2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 56, 108, 180)),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 56, 108, 180),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
