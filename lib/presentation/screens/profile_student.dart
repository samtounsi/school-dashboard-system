import 'dart:js_interop';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';

import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_state.dart';
import 'package:web_schoolapp/data/models/student_profile_model.dart';

import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_student.dart';
import 'package:web_schoolapp/presentation/screens/parent_profile.dart';

import 'package:web_schoolapp/presentation/screens/students_marks.dart';

import 'attendanceDaysForStudent.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile({
    super.key,
    required this.studentId,
  });

  final int studentId;

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
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController parentNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController gradeStudentController = TextEditingController();
  TextEditingController classStudentController = TextEditingController();
  TextEditingController gbaStudentController = TextEditingController();
  TextEditingController nationalityStudentController = TextEditingController();
  TextEditingController bioStudentController = TextEditingController();
  TextEditingController passwordStudentController=TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  Uint8List? imageFile;
  bool imageAvailable = false;

  bool isBottomSheetShown = false;

  @override
  void initState() {
    StudentProfileCubit.get(context).getStudentProfile(widget.studentId);
    super.initState();
  }

  void _setData(StudentProfileModel student) {
    usernameController.text = "${student.userName}";
    firstNameController.text = "${student.firstName}";
    lastNameController.text = "${student.lastName}";
    fatherNameController.text = "${student.fatherName}";
    motherNameController.text = "${student.motherName}";
    motherLastName.text = "${student.motherLastName}";
    addressController.text = "${student.address}";
    DateTime date = DateTime.parse(student.birthday);
    String formattedDate =
        "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
    dateOfBirth.text = formattedDate;
    genderController.text = "${student.gender}";
    gradeStudentController.text = "${student.gradeName}";
    classStudentController.text = "${student.className}";
    phoneController.text = "${student.phoneNumber}";
    telephoneController.text = "${student.telephoneNumber}";
    parentNumberController.text = "${student.parentPhoneNumber}";
    gbaStudentController.text = "${student.gba}";
    nationalityStudentController.text = "${student.nationality}";
    bioStudentController.text=student.bio.toString().isEmpty?"no bio yet":"${student.bio}";
  }

  @override
  Widget build(BuildContext context) {
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
          'Student\'s profile',
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
      body: BlocConsumer<StudentProfileCubit, StudentProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ErrorStudentProfileState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is SuccessStudentPorfileState) {
            _setData(state.student);
            return SingleChildScrollView(
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
                                        controller: usernameController,
                                        type: TextInputType.name,
                                        label: 'username',
                                        prefix: Icons.person,
                                        prefixColor: AppColors.aqua,
                                        validate: (value) {},
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: firstNameController,
                                          type: TextInputType.name,
                                          label: 'firstName',
                                          prefix: Icons.person,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: lastNameController,
                                          type: TextInputType.text,
                                          prefix: Icons.person,
                                          label: "LastName",
                                          validate: (value) {},
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
                                        controller: fatherNameController,
                                        type: TextInputType.text,
                                        prefix: Icons.person,
                                        label: "Father's Name",
                                        validate: (value) {},
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: motherNameController,
                                          type: TextInputType.name,
                                          label: 'motherName',
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: motherLastName,
                                          type: TextInputType.name,
                                          label: 'motherLastName',
                                          prefix: Icons.person,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
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
                                          controller: genderController,
                                          type: TextInputType.name,
                                          label: 'gender',
                                          validate: (value) {}),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: gradeStudentController,
                                          type: TextInputType.name,
                                          label: 'grade',
                                          prefix: Icons.grading,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: classStudentController,
                                          type: TextInputType.text,
                                          label: "class",
                                          prefix: Icons.class_,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
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
                                            print(DateFormat.yMMMd()
                                                .format(value!));
                                            dateOfBirth.text =
                                                DateFormat.yMMMd()
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
                                          validate: (value) {}),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: telephoneController,
                                          type: TextInputType.number,
                                          label: 'telephone number',
                                          prefix: Icons.phone,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: parentNumberController,
                                          type: TextInputType.number,
                                          label: "parent number",
                                          prefix: Icons.phone_android,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
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
                                          validator: (value) {},
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
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 50),
                                        child: defaultformfeild(
                                          controller: gbaStudentController,
                                          type: TextInputType.number,
                                          Width: 400,
                                          label: 'GPA',
                                          prefix: Icons.star_rate,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 50),
                                        child: defaultformfeild(
                                          Width: 400,
                                          controller:
                                              nationalityStudentController,
                                          type: TextInputType.text,
                                          validate: (value) {},
                                          label: 'nationality',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      defaultformfeild(
                                        controller: bioStudentController,
                                        type: TextInputType.name,
                                        label: 'bio',
                                        prefix: Icons.person,
                                        prefixColor: AppColors.aqua,
                                        validate: (value) {},
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultformfeild(
                                          controller: passwordStudentController,
                                          type: TextInputType.name,
                                          label: 'password',
                                          prefix: Icons.person,
                                          prefixColor: AppColors.aqua,
                                          validate: (value) {},

                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 50),
                                        child: defaultTextButton(
                                            text: "Parent's Profile",
                                            function: () {
                                              navigateTo(
                                                  context, ParentProfile());
                                            },
                                            isUpperCase: true,
                                            radius: 50,
                                            width: 250,
                                            height: 50,
                                            background: Colors.white,
                                            textColor: AppColors.aqua,
                                            textSize: 20,
                                            fontWeight: FontWeight.bold,
                                            borderColor: Colors.grey,
                                            borderWidth: 1),
                                      ),
                                    ],
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
                        SizedBox(width: 50),
                        ConditionalBuilder(
                          condition: state is! AppDateStateLoading,
                          builder: (BuildContext context) {
                            return defaultTextButton(
                              text: 'UPDATE',
                              function: () {
                                StudentProfileCubit.get(context).post();
                              },
                              isUpperCase: true,
                              radius: 50,
                              width: 380,
                              height: 50,
                              background: AppColors.aqua,
                              textSize: 20,
                              fontWeight: FontWeight.bold,
                            );
                          },
                          fallback: (BuildContext context)=>CircularProgressIndicator(),

                        ),
                        SizedBox(
                          width: 50,
                        ),
                        defaultTextButton(
                          text: 'Show Attendance',
                          function: () {
                            navigateTo(
                              context,
                              AttendanceDaysStudent(
                                absenceDays: state.student.absences,
                              ),
                            );
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
                    SizedBox(height: 50),
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
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
                  backgroundImage:
                      // imageFile == null?

                      AssetImage(
                    "images/profile.png",
                  )
                  //         : MemoryImage(Uint8List.fromList(imageFile!))
                  //             as ImageProvider,
                  //
                  //     //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     var image = await ImagePickerWeb.getImageAsBytes();
                  //     setState(() {
                  //       imageFile = image!;
                  //       imageAvailable = true;
                  //     });
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.only(bottom: 3),
                  //     child: Container(
                  //       child: CircleAvatar(
                  //         radius: 17,
                  //         backgroundColor: AppColors.backgroundcolor,
                  //         child: Icon(
                  //           Icons.edit,
                  //           color: AppColors.aqua,
                  //           size: 20,
                  //         ),
                  //       ),
                  //     ),
                  ))
        ],
      );
}
