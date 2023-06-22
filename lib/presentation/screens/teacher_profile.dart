// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_staff.dart';

import '../components and constants/alert_dialog.dart';

var formKey = GlobalKey<FormState>();

var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
TextEditingController dateOfBirth = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController nationalityController = TextEditingController();
TextEditingController universityController = TextEditingController();
TextEditingController experienceYearsController = TextEditingController();
TextEditingController subjectController = TextEditingController();
TextEditingController classController = TextEditingController();
TextEditingController birthdayController = TextEditingController();
TextEditingController salaryController = TextEditingController();

TextEditingController passwordController = TextEditingController();

TextEditingController usernameController= TextEditingController();

Uint8List? imageFile;
bool imageAvailable = false;
List<String>selectedSubjects=[];


class TeacherProfile extends StatefulWidget {
  String? id;
  TeacherProfile({required this.id});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  String? id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTeacherWebCubit,AppTeacherWebStates>(
      listener: (context,state)
      {
        if(state is AppTeacherProfileSuccessState)
        {
          usernameController.text=state.teacherProfileModel.username.toString();
          firstNameController.text=state.teacherProfileModel.firstName.toString();
          lastNameController.text=state.teacherProfileModel.lastName.toString();
          addressController.text=state.teacherProfileModel.address.toString();
          nationalityController.text=state.teacherProfileModel.nationality.toString();
          universityController.text=state.teacherProfileModel.university.toString();
          experienceYearsController.text=state.teacherProfileModel.yearsOfExperience.toString();
          dateOfBirth.text=state.teacherProfileModel.birthday.toString();
          emailController.text=state.teacherProfileModel.email.toString();
          genderController.text=state.teacherProfileModel.gender.toString();
          phoneController.text=state.teacherProfileModel.phoneNumber.toString();
          selectedSubjects.replaceRange(0, selectedSubjects.length,state.teacherProfileModel.subjects! );
        }
      },
      builder: (context,state)
      {
        var model =AppTeacherWebCubit.get(context).teacherProfileModel;
        usernameController.text=model!.username.toString();
        firstNameController.text=model.firstName.toString();
        lastNameController.text=model.lastName.toString();
        addressController.text=model.address.toString();
        nationalityController.text=model.nationality.toString();
        universityController.text=model.university.toString();
        experienceYearsController.text=model.yearsOfExperience.toString();
        dateOfBirth.text=model.birthday.toString();
        emailController.text=model.email.toString();
        genderController.text=model.gender.toString();
        phoneController.text=model.phoneNumber.toString();
        selectedSubjects.replaceRange(0, selectedSubjects.length,model.subjects! );
        return ConditionalBuilder(
          condition: state is ! AppTeacherProfileLoadingState,
          builder:(context)=> Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.darkBlue,
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
                            color: AppColors.darkBlue,
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
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SafeArea(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'images/Learning-panaBLUE.svg',
                              width: 350.0,
                              height: 350.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          SizedBox(height: 50,),
                          Form(
                            key: formKey,
                            child: Column(
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
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: lastNameController,
                                        type: TextInputType.name,
                                        label: 'LastName',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: genderController,
                                        type: TextInputType.text,
                                        prefix: Icons.perm_identity_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        labelTextColor: AppColors.darkBlue,
                                        label: 'Gender',
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
                                      controller: nationalityController,
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
                                      padding: EdgeInsetsDirectional.only(start: 50),
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
                                      padding: EdgeInsetsDirectional.only(start: 50),
                                      child: defaultformfeild(
                                        controller: experienceYearsController,
                                        type: TextInputType.number,
                                        prefix: Icons.work_history_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        label: 'Years Of Experience',
                                        labelTextColor: AppColors.darkBlue,
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
                                    Icon(
                                      Icons.calendar_today,
                                      color: AppColors.darkBlue,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
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
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050))
                                                .then((value) {
                                              print(DateFormat.yMMMd()
                                                  .format(value!));
                                              DateFormat('dd/MM/yyyy').format(value);
                                            });
                                          },
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
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
                                          width: 500,
                                          child: TextFormField(
                                            controller: addressController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'This field is required';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: AppColors.darkBlue,
                                                      width: 3)),
                                              border: OutlineInputBorder(),
                                              labelText: "Detailed address",
                                              labelStyle: TextStyle(
                                                color: AppColors.darkBlue,
                                              ),
                                              focusColor: Colors.purple,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 50,),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(top:40),
                                      child: Column(
                                        children: [
                                          defaultTextButton(
                                              text: 'Teacher\'s subjects',
                                              isUpperCase: false,
                                              background: Colors.white,
                                              borderWidth: 1,
                                              textSize: 20,
                                              textColor: AppColors.darkBlue,
                                              borderColor: Colors.grey,
                                              function: ()
                                              {
                                                showMultiSelect();
                                              }, radius: 50),
                                          Divider(),
                                          Wrap(
                                            children: selectedSubjects.map((e) =>Padding(
                                              padding: EdgeInsetsDirectional.only(end: 2.0),
                                              child: Chip(label: Text(e),),
                                            )).toList(),
                                          )
                                        ],
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
                                      prefix: Icons.phone,
                                      prefixColor: AppColors.darkBlue,
                                      labelTextColor: AppColors.darkBlue,
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
                                        Width: 550,
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        label: 'Email Address',
                                        prefix: Icons.email_outlined,
                                        prefixColor: AppColors.darkBlue,
                                        labelTextColor: AppColors.darkBlue,
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
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(bottom: 50),
                                      child: defaultformfeild(
                                        controller: usernameController,
                                        type: TextInputType.name,
                                        Width: 400,
                                        label: 'User Name',
                                        labelTextColor: AppColors.darkBlue,
                                        prefix: Icons.account_circle_outlined,
                                        prefixColor: AppColors.darkBlue,
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
                                        ispassword: AppTeacherWebCubit.get(context).isPassword,
                                        suffix: AppTeacherWebCubit.get(context).suffix,
                                        suffixColor: AppColors.darkBlue,
                                        suffixpressed: () {
                                          AppTeacherWebCubit.get(context)
                                              .changePasswordVisibility();
                                        },
                                        label: 'Password',
                                        labelTextColor: AppColors.darkBlue,
                                        prefix: Icons.lock_outline,
                                        prefixColor: AppColors.darkBlue,
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
                                SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 230, end: 150),
                                  child: defaultTextButton(
                                    text: 'update',
                                    function: () {},
                                    isUpperCase: true,
                                    radius: 50,
                                    width: 380,
                                    height: 50,
                                    background:
                                    const Color.fromARGB(255, 56, 108, 180),
                                    textSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
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
                color: AppColors.darkBlue,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  showMultiSelect()async
  {
    final List<String>subjects=
    ['Arabic','English','French','Math','Physics','Chemistry','Art','Music','Sport','Science','Technology','Philosophy','Social Studies','Culture','Religion',];
    final List<String>results=await showDialog(context: context,
        builder: (BuildContext context)
        {
          return MultiSelect(items: subjects);
        });
    if(results!=null)
    {
      setState(() {
        selectedSubjects=results;
      });
    }

  }

}
