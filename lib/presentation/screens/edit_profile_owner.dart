import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_schoolapp/business%20logic/cubits/edit_profile_backup_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/edit_profile_backup_cubit/state.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../components and constants/components.dart';

class EditProfileOwner extends StatelessWidget {
  EditProfileOwner({Key? key}) : super(key: key);
  TextEditingController userNameOwnerEdit = TextEditingController();
  TextEditingController passwordOwnerEdit = TextEditingController();
  TextEditingController successAvg = TextEditingController();
  TextEditingController yearsDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditBackUpCubit, EditBackupState>(
      listener: (context, state) {
        if (state is EditProfileOwnerSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 550, vertical: 16),
                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        state.e.message.toString(),
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
          userNameOwnerEdit.text = state.e.usernameOwner;
          passwordOwnerEdit.text = "";}
          if(state is BackUpStateSuccess)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 550, vertical: 16),
                    child: Container(
                        height: 50,
                        constraints: const BoxConstraints(maxWidth: 400),
                        decoration: BoxDecoration(
                            color: AppColors.lightOrange,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            state.back.message,
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


      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 30),
                    child: defaultTextButton(
                        text: 'annual flip',
                        function: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Getting ready for ',
                                  style: TextStyle(fontSize:30,color: AppColors.darkBlue,fontWeight: FontWeight.w700)),
                                  Text('the new year',
                                      style: TextStyle(fontSize:30,color: AppColors.darkBlue,fontWeight: FontWeight.w700)),
                                ],
                              ),
                              content: Container(
                                height: 300,
                                child: Column(
                                  children: [
                                    SizedBox(height: 30,),
                                    defaultformfeild(
                                      label: 'success average',
                                      controller: successAvg,
                                      type: TextInputType.text,
                                      validate: (value) {},
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    defaultformfeild(
                                      label: 'current year',
                                        controller: yearsDate,
                                        type: TextInputType.text,
                                        validate: (value) {}),
                                    SizedBox(height: 30,),
                                    ConditionalBuilder(
                                      condition: state is ! BackUpStateLoading,
                                      builder: (context) {
                                        return defaultTextButton(text: 'send', function: (){
                                          EditBackUpCubit.get(context).backUp(successAvg.text, yearsDate.text);
                                        }, radius: 30,
                                            width: 150,
                                            background: AppColors.darkBlue);
                                      },
                                      fallback: (context) =>Center(child: CircularProgressIndicator(),),

                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        radius: 30,
                        width: 150),
                  ),
                ]),
            body: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'You can modify the usename and password',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                                color: AppColors.darkBlue,
                              ),
                              maxLines: 2,
                            ),
                            Text(
                              'by entering the old ones...',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                                color: AppColors.darkBlue,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(bottom: 50),
                                child: defaultformfeild(
                                  controller: userNameOwnerEdit,
                                  type: TextInputType.name,
                                  Width: 500,
                                  verticalPadding: 30,
                                  label: 'You have to enter username',
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
                              Padding(
                                padding: EdgeInsetsDirectional.only(bottom: 50),
                                child: defaultformfeild(
                                  verticalPadding: 30,
                                  Width: 500,
                                  controller: passwordOwnerEdit,
                                  type: TextInputType.text,
                                  ispassword:
                                      EditBackUpCubit.get(context).isPassword,
                                  suffix: EditBackUpCubit.get(context).iconDate,
                                  suffixpressed: () {
                                    EditBackUpCubit.get(context)
                                        .changeVisiblePassword();
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
                              ConditionalBuilder(
                                  condition: state is! EditProfileOwnerLoading,
                                  builder: (BuildContext context) {
                                    return defaultTextButton(
                                      text: 'Edit',
                                      function: () {
                                        EditBackUpCubit.get(context)
                                            .editProfileOwner(
                                                userNameOwnerEdit.text,
                                                passwordOwnerEdit.text);
                                      },
                                      isUpperCase: false,
                                      radius: 50,
                                      width: 300,
                                      height: 50,
                                      background: AppColors.darkBlue,
                                      textSize: 20,
                                      fontWeight: FontWeight.bold,
                                    );
                                  },
                                  fallback: (BuildContext context) => Center(
                                        child: CircularProgressIndicator(),
                                      )),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      'images/Reset password.svg',
                      width: 400.0,
                      height: 400.0,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
