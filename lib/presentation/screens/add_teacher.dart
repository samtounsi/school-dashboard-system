// ignore_for_file: unused_import, depend_on_referenced_packages, prefer_const_constructors, sized_box_for_whitespace, avoid_print, prefer_const_literals_to_create_immutables, sort_child_properties_last


import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Image;

import 'dart:typed_data';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'dart:html'as html;
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/data/models/teacherRegisterModel.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'package:web_schoolapp/presentation/screens/add_staff.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

import '../components and constants/alert_dialog.dart';
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
String genderValue = 'male';
class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTeacherWebCubit, AppTeacherWebStates>(
      listener: (context, state)
      {
        if(state is AppTeacherRegisterSuccessState)
        {
          navigateTo(context, UserNamePasswordScreen(registerModel: state.teacherRegisterModel,));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

              child: Container(
                  height: 50,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(state.teacherRegisterModel.message.toString(),
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
        else if(state is AppTeacherRegisterErrorState)
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
                      padding:  EdgeInsetsDirectional.only(start: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Add Teacher',
                                style: TextStyle(fontSize: 50, color: AppColors.darkBlue),
                              ),
                              SizedBox(
                                height: 80,
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
                                          child:Container(
                                            padding: EdgeInsets.only(left: 10),
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border:
                                                Border.all(color: Colors.grey),
                                                borderRadius:
                                                BorderRadius.circular(7)),
                                            child: DropdownButton(
                                              value: genderValue,
                                              items: [
                                                //add items in the dropdown
                                                DropdownMenuItem(
                                                  child: Text("male"),
                                                  value: "male",
                                                ),
                                                DropdownMenuItem(
                                                    child: Text("female"),
                                                    value: "female"),
                                              ],
                                              onChanged: (value) {
                                                AppTeacherWebCubit.get(context)
                                                    .changeGender(value!);
                                                genderValue =
                                                    AppTeacherWebCubit.get(context)
                                                        .genderValue;
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
                                                  DateFormat('dd-MM-yyyy').format(value);
                                            });
                                          },
                                        )),
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
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(top:15),
                                          child: Column(
                                            children: [
                                              defaultTextButton(
                                                  text: 'Select Teacher\'s subjects',
                                                  isUpperCase: false,
                                                  background: Colors.white,
                                                  borderWidth: 1,
                                                  textSize: 20,
                                                  width: 270,
                                                  textColor: AppColors.darkBlue,
                                                  borderColor: Colors.grey,
                                                  function: ()
                                                  {
                                                    showMultiSelect();
                                                  }, radius: 10),
                                              Divider(),
                                              Wrap(
                                                children: selectedSubjects.map((e) =>Padding(
                                                  padding: EdgeInsetsDirectional.only(end: 10.0),
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
                                      child: ConditionalBuilder(
                                        condition: state is ! AppTeacherRegisterLoadingState,
                                        builder:(context) =>defaultTextButton(
                                          text: 'SAVE',
                                          function: ()async
                                          {
                                            if(formKey.currentState!.validate())
                                            {
                                              print(firstNameController.text);
                                              print(lastNameController.text);
                                              print(addressController.text);
                                              print(phoneController.text);
                                              print(nationalityController.text);
                                              print(experienceYearsController.text);
                                              print(AppTeacherWebCubit.get(context).genderValue);
                                              print(dateOfBirth.text);
                                              print(selectedSubjects);
                                              RegisterModelTeacher model=RegisterModelTeacher(
                                                  firstName: firstNameController.text,
                                                  lastName: lastNameController.text,
                                                  address: addressController.text,
                                                  phoneNumber: phoneController.text,
                                                  gender: AppTeacherWebCubit.get(context)
                                                      .genderValue,
                                                  birthday: '2002-04-20',
                                                  yearsOfExperience:experienceYearsController.text,
                                                  nationality: nationalityController.text,
                                                  subjects: selectedSubjects,
                                                university: universityController.text,
                                                email: emailController.text
                                              );

                                             AppTeacherWebCubit.get(context).postTeacher(data:model);
                                              print(model.toJson(model).toString());
                                            }

                                          },
                                          isUpperCase: true,
                                          radius: 50,
                                          width: 380,
                                          height: 50,
                                          background:
                                          AppColors.darkBlue,
                                          textSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        fallback: (context)=>Center(child: CircularProgressIndicator()),
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
                          SvgPicture.asset(
                            'images/TeacherStudent.svg',
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



  List<String>selectedSubjects=[];
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
          backgroundImage:
            selectedImageInBytes==null? AssetImage("images/profile.png",):MemoryImage(Uint8List.fromList(selectedImageInBytes!))as ImageProvider
         /* selectdFile.isEmpty ? AssetImage("images/profile.png",): MemoryImage(Uint8List.fromList(selectedImageInBytes!)) as ImageProvider*/
         // imageFile == null
           //   ? AssetImage("images/profile.png",)
             // : MemoryImage(Uint8List.fromList(imageFile!))
          //as ImageProvider,

          //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
        ),
      ),
      GestureDetector(
        onTap: () async {
          startWebFilePicker();
        /*  FilePickerResult? filePickerResult=await FilePicker.platform.pickFiles();
          if(filePickerResult!=null)
          {
            setState(() {
              selectdFile=filePickerResult.files.first.name;
              selectedImageInBytes=filePickerResult.files.first.bytes;
            });
          }
          print(selectdFile);*/
         //var image = await ImagePickerWeb.getImageAsBytes();
          //setState(() {
            //imageFile = image!;
            //imageAvailable = true;
         // });


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







  XFile? file;
  Uint8List? selectedImageInBytes;
  List<int>? selectdFile;
  startWebFilePicker()async
  {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          selectedImageInBytes =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          selectdFile = selectedImageInBytes;
        });
      });
      reader.readAsDataUrl(file);
    });
  }


}


