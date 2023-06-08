// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

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
TextEditingController rateController = TextEditingController();
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

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, DashBoardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/signS.svg',
                    width: 500.0,
                    height: 500.0,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          text(
                            'Add Student',
                            size: 50,
                            color: AppColors.aqua,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 310),
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
                                  padding:
                                      EdgeInsetsDirectional.only(start: 50),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: DropdownButton(
                                      value: genderValue,
                                      items: [
                                        //add items in the dropdown
                                        DropdownMenuItem(
                                          child: Text('male'),
                                          value: 'male',
                                        ),
                                        DropdownMenuItem(
                                            child: Text('female'),
                                            value: 'female'),
                                      ],
                                      onChanged: (value) {
                                        StudentCubit.get(context)
                                            .changeGender(value!);
                                        genderValue =
                                            StudentCubit.get(context).gender!;
                                      },
                                      icon: Padding(
                                          //Icon at tail, arrow bottom is default icon
                                          padding: EdgeInsets.only(
                                              left: 20, right: 10),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.darkAqua,
                                          )),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.darkAqua),
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
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: DropdownButton(
                                      value: gradeValue,
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
                                            value: "9th grade"),
                                      ],
                                      onChanged: (value) {
                                        StudentCubit.get(context)
                                            .changeGrade(value!);
                                        gradeValue = StudentCubit.get(context)
                                            .dropDown1!;
                                      },
                                      icon: Padding(
                                          //Icon at tail, arrow bottom is default icon
                                          padding: EdgeInsets.only(
                                              left: 20, right: 10),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: AppColors.darkAqua,
                                          )),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.darkAqua),
                                      dropdownColor: Colors.white,
                                      //dropdown background color
                                      underline: Container(),
                                      //remove underline
                                      isExpanded:
                                          true, //make true to make width 100%
                                    ),
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
                                        color: AppColors.darkAqua,
                                        size: 40,
                                      ),
                                      //icon of text field
                                      labelText: "Date of Birth",
                                      labelStyle: TextStyle(
                                        color: AppColors.darkAqua,
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
                                  padding:
                                      EdgeInsetsDirectional.only(start: 50),
                                  child: defaultformfeild(
                                    controller: telephoneController,
                                    type: TextInputType.number,
                                    label: 'telephone number',
                                    prefix: Icons.phone,
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
                                  padding:
                                      EdgeInsetsDirectional.only(start: 50),
                                  child: defaultformfeild(
                                    controller: parentNumberController,
                                    type: TextInputType.number,
                                    label: "parent number",
                                    prefix: Icons.phone_android,
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
                                  color: AppColors.darkAqua,
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
                                      labelText: 'Detailed address',
                                      labelStyle: TextStyle(
                                        color: AppColors.darkAqua,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.darkAqua)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                defaultformfeild(
                                  Width: 860,
                                  controller: rateController,
                                  type: TextInputType.number,
                                  label: 'Rate',
                                  prefix: Icons.star_rate,
                                  prefixColor: Color(0xFF3A968E),
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    }
                                    if (value.length > 2) {
                                      return 'Enter correct rate ';
                                    }

                                    return null;
                                  },
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
                                  if (formKey.currentState!.validate()) {
                                    //navigateTo(context, StudentsDisplay());
                                    navigateTo(
                                        context, UserNamePasswordScreen());
                                  }
                                },
                                isUpperCase: true,
                                radius: 50,
                                width: 380,
                                textSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      )
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
                  ? AssetImage("images/profile.png")
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
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: AppColors.aqua,
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
