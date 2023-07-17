// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/states.dart';
import 'package:web_schoolapp/data/models/login_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/layouts/layout1.dart';
import 'package:web_schoolapp/presentation/screens/layouts/staff_layout.dart';

import '../../network/cache_helper.dart';

var formKey = GlobalKey<FormState>();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var scaffoldKey = GlobalKey<ScaffoldState>();

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is AppLoginSuccessState) {
            if (state.loginModel.message == 'successful login') {
              CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                  .then((value) {
                token = state.loginModel.token!;
                type = state.loginModel.type!;
                print(token);
                print(type);
                print(state.loginModel.message);
                if (state.loginModel.type == 'owner') {
                  navigateAndFinish(context, DashBoard());
                } else if (state.loginModel.type == 'admin') {
                  navigateAndFinish(context, DashBoardStaff());
                }
              }).then((value) {
                CacheHelper.saveData(key: 'type', value: state.loginModel.type!)
                    .then((value) {
                  type = state.loginModel.type!;
                  print(token);
                  print(type);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 500, vertical: 16),
                        child: Container(
                            height: 50,
                            constraints: const BoxConstraints(maxWidth: 400),
                            decoration: BoxDecoration(
                                color: AppColors.lightOrange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                state.loginModel.message.toString(),
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
                });
              });
            }
          } else if (state is AppLoginErrorState) {
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
                          maxLines: 2,
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
          return Card(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
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
                          ConditionalBuilder(
                            condition: state is! AppLoginLoadingState,
                            builder: (context) => defaultTextButton(
                              text: 'Login',
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AppLoginCubit.get(context).Login(
                                      userName: usernameController.text,
                                      password: passwordController.text);
                                }
                              },
                              isUpperCase: true,
                              radius: 50,
                              width: 400,
                              height: 50,
                              background: AppColors.lightOrange,
                              textSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
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
                  'images/login.svg',
                  width: 500.0,
                  height: 500.0,
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
