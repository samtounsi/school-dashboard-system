import 'dart:typed_data';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/staff_profile/states.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';

import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_student.dart';
import 'package:web_schoolapp/presentation/screens/usernamePasswordScreen.dart';

import '../../business logic/cubits/staff_profile/cubit.dart';
import 'package:intl/intl.dart';

TextEditingController nameParentController = TextEditingController();

TextEditingController passwordParentController = TextEditingController();

TextEditingController usernameParentController = TextEditingController();

var formKey = GlobalKey<FormState>();

class ParentProfile extends StatelessWidget {
  ParentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Parent's Profile",
      style: TextStyle(color: AppColors.darkBlue,
      fontSize: 30),),
      backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back,
        color: AppColors.darkBlue,),),
       ),
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'images/parents-pana.svg',
                          width: 500.0,
                          height: 500.0,
                        ),
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 250),
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    bottom: 50, start: 50),
                                child: defaultformfeild(
                                  controller: usernameParentController,
                                  type: TextInputType.name,
                                  Width: 250,
                                  label: 'username',
                                  labelTextColor: AppColors.darkBlue,
                                  prefix: Icons.person,
                                  prefixColor: AppColors.darkBlue,
                                  validate: (value) {},
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(bottom: 50),
                                child: defaultformfeild(
                                  controller: nameParentController,
                                  Width: 250,
                                  type: TextInputType.name,
                                  labelTextColor: AppColors.darkBlue,
                                  label: "name",
                                  prefix: Icons.person,
                                  prefixColor: AppColors.darkBlue,
                                  validate: (value) {},
                                ),
                              ),
                            ],
                          ),
                          BlocConsumer<StudentCubit, DashBoardState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        bottom: 50, start: 60),
                                    child: defaultformfeild(
                                      Width: 400,
                                      controller: passwordParentController,
                                      type: TextInputType.text,
                                      ispassword:
                                          StudentCubit.get(context).isPassword,
                                      suffix: StudentCubit.get(context).suffix,
                                      suffixColor: AppColors.darkBlue,
                                      suffixpressed: () {
                                        StudentCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      label: 'Password',
                                      labelTextColor: AppColors.darkBlue,
                                      prefix: Icons.lock_outline,
                                      prefixColor: AppColors.darkBlue,
                                      validate: (value) {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              );
                            },
                            listener: (context, state) {},
                          ),
                          Column(
                            children: [
                              defaultTextButton(
                                text: 'Update',
                                function: () {},
                                isUpperCase: true,
                                radius: 50,
                                width: 400,
                                height: 50,
                                background: AppColors.darkBlue,
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
                  ],
                ),
              ),
            ),
          ),
        ],
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
                backgroundImage: AssetImage(
                  "images/profile.png",
                )

                //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
                ),
          ),
        ],
      );
}
