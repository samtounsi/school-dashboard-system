import 'dart:js_interop';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_state.dart';
import 'package:web_schoolapp/data/models/active_send_student_model.dart';
import 'package:web_schoolapp/data/models/send_edit_student_profile_model.dart';
import 'package:web_schoolapp/data/models/student_profile_model.dart';

import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_student.dart';
import 'package:web_schoolapp/presentation/screens/add_teacher.dart';
import 'package:web_schoolapp/presentation/screens/parent_profile.dart';

import 'package:web_schoolapp/presentation/screens/students_marks.dart';

import 'attendanceDaysForStudent.dart';

class StudentProfile extends StatefulWidget {
  StudentProfile(
      {super.key, required this.studentId});

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
  TextEditingController passwordStudentController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherLastName = TextEditingController();

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

  StudentProfileModel? student;

  // void _setData(StudentProfileModel student) {
  //   usernameController.text = "${student.userName}";
  //   firstNameController.text = "${student.firstName}";
  //   lastNameController.text = "${student.lastName}";
  //   fatherNameController.text = "${student.fatherName}";
  //   motherNameController.text = "${student.motherName}";
  //   motherLastName.text = "${student.motherLastName}";
  //   addressController.text = "${student.address}";
  //   DateTime date = DateTime.parse(student.birthday);
  //   String formattedDate =
  //       "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
  //   dateOfBirth.text = formattedDate;
  //   genderController.text = "${student.gender}";
  //   gradeStudentController.text = "${student.gradeName}";
  //   classStudentController.text = "${student.className}";
  //   phoneController.text = "${student.phoneNumber}";
  //   telephoneController.text = "${student.telephoneNumber}";
  //   parentNumberController.text = "${student.parentPhoneNumber}";
  //   gbaStudentController.text = "${student.gba}";
  //   nationalityStudentController.text = "${student.nationality}";
  //   bioStudentController.text =
  //       student.bio.toString().isNull ? "no bio yet" : "${student.bio}";
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {
        if (state is SuccessStudentPorfileState) {
          usernameController.text = state.student.userName;
          firstNameController.text = state.student.firstName;
          lastNameController.text = state.student.lastName;
          fatherNameController.text = state.student.fatherName;
          motherNameController.text = state.student.motherName;
          motherLastName.text = state.student.motherLastName;
          addressController.text = state.student.address;
          DateTime date = DateTime.parse(state.student.birthday);
          String formattedDate =
              "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
          dateOfBirth.text = formattedDate;
          genderController.text = state.student.gender;
          gradeStudentController.text = state.student.gradeName;
          classStudentController.text = state.student.className;
          phoneController.text = state.student.phoneNumber;
          telephoneController.text = state.student.telephoneNumber;
          parentNumberController.text = state.student.parentPhoneNumber;
          gbaStudentController.text = state.student.gba.toString();
          nationalityStudentController.text = state.student.nationality;
          bioStudentController.text = state.student.bio.toString().isEmpty
              ? "no bio yet"
              : state.student.bio.toString();
        }
        if (state is SuccessUpdateStudentProfileState) {
          usernameController.text = state.studentProfileEditModel.userNameEdit;
          firstNameController.text =
              state.studentProfileEditModel.firstNameEdit;
          lastNameController.text = state.studentProfileEditModel.lastNameEdit;
          fatherNameController.text =
              state.studentProfileEditModel.fatherNameEdit;
          motherNameController.text =
              state.studentProfileEditModel.motherNameEdit;
          motherLastName.text =
              state.studentProfileEditModel.motherLastNameEdit;
          addressController.text = state.studentProfileEditModel.addressEdit;
          DateTime date =
              DateTime.parse(state.studentProfileEditModel.birthdayEdit);
          String formattedDate =
              "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
          dateOfBirth.text = formattedDate;
          genderController.text = state.studentProfileEditModel.genderEdit;
          gradeStudentController.text =
              state.studentProfileEditModel.gradeNameEdit;
          classStudentController.text =
              state.studentProfileEditModel.classNameEdit;
          phoneController.text = state.studentProfileEditModel.phoneNumberEdit;
          telephoneController.text =
              state.studentProfileEditModel.telephoneNumberEdit;
          parentNumberController.text =
              state.studentProfileEditModel.parentPhoneNumberEdit;
          gbaStudentController.text =
              state.studentProfileEditModel.gbaEdit.toString();
          nationalityStudentController.text =
              state.studentProfileEditModel.nationalityEdit;
          bioStudentController.text =
              state.studentProfileEditModel.bioEdit.toString().isEmpty
                  ? "no bio yet"
                  : state.studentProfileEditModel.bioEdit.toString();
          passwordStudentController.text = "";

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 500, vertical: 16),
                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: const BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(
                      child: Text(
                        "updated successfully",
                        maxLines: 2,
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
            ),
          );
        }
        if(state is ChangeStateStudentSuccessState)
          {
            var modelActivate=StudentProfileCubit.get(context).successActive;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 500, vertical: 16),
                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: const BoxDecoration(
                        color: AppColors.aqua,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        modelActivate!.msg,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColors.darkBlue,
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
        var modelP=StudentProfileCubit.get(context).studentProfile;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.aqua,
              toolbarHeight: 70,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 15,
                  top: 15,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(
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
              title: const Text(
                'Student\'s profile',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: 15,
                    top: 15,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon:Icon(StudentProfileCubit.get(context).iconData,
                          color: AppColors.aqua),
                          onPressed: () {
                            ActiveStudentSendModel active =
                                ActiveStudentSendModel(
                                    idA: widget.studentId.toString(),
                                    typeA:modelP!.type );
                            StudentProfileCubit.get(context).changeStateStudent(active);
                            StudentProfileCubit.get(context).changeState();

                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! LoadingStudentProfileState,
              builder: (context) {
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
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.symmetric(
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
                                const SizedBox(
                                  height: 30,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            padding: const EdgeInsetsDirectional.only(
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
                                            padding: const EdgeInsetsDirectional.only(
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
                                      const SizedBox(
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
                                            padding: const EdgeInsetsDirectional.only(
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
                                            padding: const EdgeInsetsDirectional.only(
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
                                      const SizedBox(
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
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller:
                                                  gradeStudentController,
                                              type: TextInputType.name,
                                              label: 'grade',
                                              prefix: Icons.grading,
                                              prefixColor: AppColors.aqua,
                                              validate: (value) {},
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller:
                                                  classStudentController,
                                              type: TextInputType.text,
                                              label: "class",
                                              prefix: Icons.class_,
                                              prefixColor: AppColors.aqua,
                                              validate: (value) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10),
                                          width: 850,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: TextField(
                                            controller: dateOfBirth,
                                            decoration: const InputDecoration(
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
                                                      initialDate:
                                                          DateTime.now(),
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
                                      const SizedBox(
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
                                            padding: const EdgeInsetsDirectional.only(
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
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller:
                                                  parentNumberController,
                                              type: TextInputType.number,
                                              label: "parent number",
                                              prefix: Icons.phone_android,
                                              prefixColor: AppColors.aqua,
                                              validate: (value) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color(0xFF3A968E),
                                            size: 40,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            width: 800,
                                            child: TextFormField(
                                              controller: addressController,
                                              validator: (value) {},
                                              decoration: const InputDecoration(
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
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
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
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
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
                                          const SizedBox(
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
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultformfeild(
                                              controller:
                                                  passwordStudentController,
                                              type: TextInputType.name,
                                              label: 'password',
                                              prefix: Icons.person,
                                              prefixColor: AppColors.aqua,
                                              validate: (value) {},
                                              ispassword:
                                                  StudentProfileCubit.get(
                                                          context)
                                                      .isPassword,
                                              suffix: StudentProfileCubit.get(
                                                      context)
                                                  .suffix,
                                              suffixColor: AppColors.aqua,
                                              suffixpressed: () {
                                                StudentProfileCubit.get(context)
                                                    .changePasswordVisibility();
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(
                                                start: 50),
                                            child: defaultTextButton(
                                                text: "Parent's Profile",
                                                function: () {
                                                  if (state
                                                      is SuccessStudentPorfileState) {
                                                    navigateTo(
                                                        context,
                                                        ParentProfile(
                                                          idParent: state
                                                              .student.parentId,
                                                          nameParent: state
                                                              .student
                                                              .parentName,
                                                          userNameParent: state
                                                              .student
                                                              .parentUsername,
                                                        ));
                                                  }
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
                                      const SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        if (state is LoadingUpdateStudentProfileState)
                          const LinearProgressIndicator(),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            defaultTextButton(
                              text: 'Show Marks',
                              function: () {
                                navigateTo(context, const ShowStudentsMarks());
                              },
                              isUpperCase: true,
                              radius: 50,
                              width: 380,
                              height: 50,
                              background: AppColors.lightOrange,
                              textSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 50),
                            defaultTextButton(
                              text: 'UPDATE',
                              function: () {
                                print(nationalityController.text);
                                StudentProfileEditSendModel s =
                                    StudentProfileEditSendModel(
                                        id: widget.studentId,
                                        userNameEditS: usernameController.text,
                                        firstNameEditS:
                                            firstNameController.text,
                                        lastNameEditS: lastNameController.text,
                                        fatherNameEditS:
                                            fatherNameController.text,
                                        motherNameEditS:
                                            motherNameController.text,
                                        motherLastNameEditS:
                                            motherLastName.text,
                                        telephoneNumberEditS:
                                            telephoneController.text,
                                        gbaEditS: gbaStudentController.text,
                                        addressEditS: addressController.text,
                                        genderEditS: genderController.text,
                                        phoneNumberEditS: phoneController.text,
                                        nationalityEditS:
                                            nationalityStudentController.text,
                                        birthdayEditS: dateOfBirth.text,
                                        gradeNameEditS:
                                            gradeStudentController.text,
                                        classNameEditS:
                                            classStudentController.text,
                                        parentPhoneNumberEditS:
                                            parentNumberController.text);

                                StudentProfileCubit.get(context)
                                    .updateStudentProfile(s);
                              },
                              isUpperCase: true,
                              radius: 50,
                              width: 380,
                              height: 50,
                              background: AppColors.aqua,
                              textSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            defaultTextButton(
                              text: 'Show Attendance',
                              function: () {
                                if (state is SuccessStudentPorfileState) {
                                  navigateTo(
                                      context,
                                      AttendanceDaysStudent(
                                        absenceDays: state.student.absences,
                                        idStudentAttendance: state.student.id,
                                      ));
                                }
                              },
                              isUpperCase: true,
                              radius: 50,
                              width: 380,
                              height: 50,
                              background: AppColors.darkBlue,
                              textSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                );
              },
              fallback: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ));
      },
    );
  }

  Widget uploadAvatar(context) => const Stack(
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
