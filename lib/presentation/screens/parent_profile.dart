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
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_state.dart';
import 'package:web_schoolapp/data/models/send_parent_edit_model.dart';
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
  ParentProfile({required this.idParent,
    required this.userNameParent,
    required this.nameParent,
    required this.urlPhoto,
    Key? key})
      : super(key: key);
  int idParent;
  String userNameParent;
  String nameParent;
  String urlPhoto;

  @override
  Widget build(BuildContext context) {
    nameParentController.text = nameParent;
    usernameParentController.text = userNameParent;

    return BlocConsumer<StudentProfileCubit, StudentProfileState>(
      listener: (context, state) {
        if (state is SuccessUpdateParentProfileState) {
          nameParentController.text =
              state.parentProfileEditModel.nameParentEdit;
          usernameParentController.text =
              state.parentProfileEditModel.userNameParentEdit;
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LoadingUpdateParentProfileState,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Parent's Profile",
                  style: TextStyle(color: AppColors.darkBlue,
                  fontSize: 30),


                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.darkBlue,
                  ),
                ),
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
                            const SizedBox(width: 100),
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
                                        Stack(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        children: [
                                          CircleAvatar(
                                            radius: 80.0,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                                radius: 70.0,
                                                backgroundColor: Colors.white,
                                                backgroundImage:NetworkImage(urlPhoto)

                                              //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
                                            ),
                                          ),
                                        ],
                                      )
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
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 50),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            bottom: 50, start: 60),
                                        child: defaultformfeild(
                                          Width: 400,
                                          controller: passwordParentController,
                                          type: TextInputType.text,
                                          ispassword: StudentCubit
                                              .get(context)
                                              .isPassword,
                                          suffix:
                                          StudentProfileCubit
                                              .get(context)
                                              .suffix,
                                          suffixColor: AppColors.darkBlue,
                                          suffixpressed: () {
                                            StudentProfileCubit.get(context)
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
                                  ),
                                  Column(
                                    children: [
                                      defaultTextButton(
                                        text: 'Update',
                                        function: () {
                                          ParentProfileEditSendModel p = ParentProfileEditSendModel(
                                              nameParentEditS: nameParentController
                                                  .text,
                                              userNameParentEditS: usernameParentController
                                                  .text,
                                              passwordParentEditS: passwordParentController
                                                  .text,
                                          idParentEdit: idParent.toString());
                                          StudentProfileCubit.get(context)
                                              .updateParentProfile(p);
                                        },
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
          },
          fallback: (BuildContext context) =>
              Center(
                child: CircularProgressIndicator(),
              ),
        );
      },

    );
  }

}
