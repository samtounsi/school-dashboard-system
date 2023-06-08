// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/layouts/layout1.dart';
import 'package:web_schoolapp/presentation/screens/layouts/staff_layout.dart';

//import 'package:project/business%20logic/cubits/login_cubit/states.dart';
//import 'package:project/presentation/shared/components%20and%20constants/constants.dart';

//import '../../business logic/cubits/login_cubit/cubit.dart';
//import '../shared/components and constants/compontents.dart';

var formKey = GlobalKey<FormState>();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Card(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Here!!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: AppColors.darkBlue),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Log in using your given user name and password, please!!',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 50),
                        child: defaultformfeild(
                          controller: usernameController,
                          type: TextInputType.name,
                          Width: 500,
                          verticalPadding: 30,
                          label: 'User Name',
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
                          controller: passwordController,
                          type: TextInputType.text,
                          ispassword: AppLoginCubit.get(context).isPassword,
                          suffix: AppLoginCubit.get(context).suffix,
                          suffixpressed: () {
                            AppLoginCubit.get(context)
                                .changePasswordVisibility();
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
                      defaultTextButton(
                        text: 'Login',
                        function: () {
                          if (usernameController.text == '1')
                            navigateAndFinish(context, DashBoard());
                          else
                            navigateAndFinish(context, DashBoardStaff());
                        },
                        isUpperCase: true,
                        radius: 50,
                        width: 400,
                        height: 50,
                        background: AppColors.lightOrange,
                        textSize: 20,
                        fontWeight: FontWeight.bold,
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
              'images/login.svg',
              width: 500.0,
              height: 500.0,
            ),
          ],
        ));
      },
    );
  }
}
