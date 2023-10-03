// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_const_constructors

import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import '../../data/models/studentRegisterModel.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_teacher.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

TextEditingController dateOfBirth = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController fatherNameAddController = TextEditingController();
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
TextEditingController motherLastNameAdd = TextEditingController();
TextEditingController nationality = TextEditingController();

var scaffoldKey = GlobalKey<ScaffoldState>();
var formKey = GlobalKey<FormState>();
Uint8List? imageFile;
bool imageAvailable = false;

bool isBottomSheetShown = false;

String genderValue = 'male';
String gradeValue = 'seventh';

final List<String> gender = ['male', 'female'];
final grades = [
  'seventh',
  'eighth',
  'ninth',
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
      listener: (context, state) {
        if (state is AppStudentRegisterSuccessState) {
          navigateTo(
              context,
              UserNamePasswordScreen(
                registerModel: state.studentRegisterModel,
              ));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 500, vertical: 16),
              child: Container(
                  height: 50,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(
                      color: AppColors.lightOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      state.studentRegisterModel.message.toString(),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ));
        } else if (state is AppStudentRegisterErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 500, vertical: 16),
                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        state.error.toString(),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              text(
                                'Add Student',
                                size: 50,
                                color: AppColors.aqua,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.symmetric(
                              //       horizontal: 310),
                              //   child: Container(
                              //     width: 200.0,
                              //     height: 200,
                              //     child: Column(
                              //       children: [
                              //         uploadAvatar(context),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Form(
                                key: formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              if (!RegExp(
                                                      "([a-zA-Z]{3,30}\s*)+")
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
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller: lastNameController,
                                              type: TextInputType.name,
                                              label: 'LastName',
                                              prefix: Icons.person,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                if (!RegExp(
                                                        "([a-zA-Z]{3,30}\s*)+")
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
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller:
                                                  fatherNameAddController,
                                              type: TextInputType.text,
                                              prefix: Icons.person,
                                              label: "Father's Name",
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                if (!RegExp(
                                                        "([a-zA-Z]{3,30}\s*)+")
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
                                              if (!RegExp(
                                                      "([a-zA-Z]{3,30}\s*)+")
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
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 50),
                                            child: defaultformfeild(
                                              controller: motherLastNameAdd,
                                              type: TextInputType.text,
                                              prefix: Icons.person,
                                              label: "Mother's LastName",
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                if (!RegExp(
                                                        "([a-zA-Z]{3,30}\s*)+")
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
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: DropdownButton(
                                                value: gradeValue,
                                                items: [
                                                  //add items in the dropdown
                                                  DropdownMenuItem(
                                                    child: Text("seventh"),
                                                    value: "seventh",
                                                  ),
                                                  DropdownMenuItem(
                                                      child: Text("eighth"),
                                                      value: "eighth"),
                                                  DropdownMenuItem(
                                                      child: Text("ninth"),
                                                      value: "ninth"),
                                                ],
                                                onChanged: (value) {
                                                  StudentCubit.get(context)
                                                      .changeGrade(value!);
                                                  gradeValue =
                                                      StudentCubit.get(context)
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
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 10),
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              width: 350,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
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
                                                      StudentCubit.get(context)
                                                          .gender!;
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
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              Width: 440,
                                              controller: nationality,
                                              type: TextInputType.name,
                                              label: 'Nationality',
                                              prefix: Icons.location_city,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                if (!RegExp(
                                                        "([a-zA-Z]{3,30}\s*)+")
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
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: TextField(
                                            controller: birthdayController,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors.aqua,
                                                        width: 3)),
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
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2050))
                                                  .then((value) {
                                                print(DateFormat('yyyy/MM/dd')
                                                    .format(value!));
                                                birthdayController.text =
                                                    DateFormat('yyyy/MM/dd')
                                                        .format(value);
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
                                               if (!RegExp(
                                                       r'(^(?:[+0]9)?[0-9]{10}$)')
                                                  .hasMatch(value!)) {
                                              return ' Enter correct number';}

                                              return null;
                                            },
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
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
                                                if (!RegExp(
                                                        r'(^(?:[+0]9)?[0-9]{10}$)')
                                                    .hasMatch(value!)) {
                                                  return ' Enter correct number';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller:
                                                  parentNumberController,
                                              type: TextInputType.number,
                                              label: "parent number",
                                              prefix: Icons.phone_android,
                                              validate: (value) {
                                                if (value!.isEmpty) {
                                                  return 'This field is required';
                                                }
                                                if (!RegExp(
                                                        r'(^(?:[+0]9)?[0-9]{10}$)')
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors.aqua,
                                                              width: 3)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        width: 860,
                                        child: TextFormField(
                                          controller: rateController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Studen\'s rate',
                                            labelStyle: TextStyle(
                                              color: AppColors.darkAqua,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors.aqua,
                                                      width: 3)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 230, end: 150),
                                        child: ConditionalBuilder(
                                          condition: state
                                              is! AppStudentRegisterLoading,
                                          builder: (context) =>
                                              defaultTextButton(
                                            text: 'SAVE',
                                            function: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                RegisterModelStudent student =
                                                    RegisterModelStudent(
                                                  firstName:
                                                      firstNameController.text,
                                                  lastName:
                                                      lastNameController.text,
                                                  fatherName:
                                                      fatherNameAddController
                                                          .text,
                                                  motherName:
                                                      motherNameController.text,
                                                  motherLastName:
                                                      motherLastNameAdd.text,
                                                  grade:
                                                      StudentCubit.get(context)
                                                          .dropDown1,
                                                  gender:
                                                      StudentCubit.get(context)
                                                          .gender,
                                                  nationality: nationality.text,
                                                  birthday:
                                                      birthdayController.text,
                                                  phoneNumber:
                                                      phoneController.text,
                                                  parentNumber:
                                                      parentNumberController
                                                          .text,
                                                  telephoneNumber:
                                                      telephoneController.text,
                                                  address:
                                                      addressController.text,
                                                  gba: rateController.text,
                                                );
                                                StudentCubit.get(context)
                                                    .postAddStudent(
                                                        data: student);
                                              }
                                            },
                                            isUpperCase: true,
                                            radius: 50,
                                            width: 380,
                                            textSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          fallback: (BuildContext context) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.aqua,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SvgPicture.asset(
                            'images/signS.svg',
                            width: 500.0,
                            height: 500.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
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
                  ? AssetImage(
                      "images/profile.png",
                    )
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
              padding: const EdgeInsetsDirectional.only(bottom: 3),
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
