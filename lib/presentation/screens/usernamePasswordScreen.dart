// ignore_for_file: unused_import, must_be_immutable, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/logComponent.dart';


class UserNamePasswordScreen extends StatelessWidget {
  UserNamePasswordScreen({Key? key}) : super(key: key);
  TextEditingController userNameStudent = TextEditingController();
  TextEditingController passwordStudent = TextEditingController();
  TextEditingController userNameParent = TextEditingController();
  TextEditingController passwordParent = TextEditingController();
  bool? navigate = false;

  @override
  Widget build(BuildContext context) {
    userNameStudent.text = "NourG";
    passwordStudent.text = "1234567890";
    userNameParent.text = "NourParent";
    passwordParent.text = "7115868";
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/loginaqua.png',
                    height: 600,
                    width: 600,
                  ),
                ],
              ),
            ),
            Spacer(),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(right: 200, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'User Added Successfully!!\nYou can send him the\nAccount Info Below ',
                      style: TextStyle(fontSize: 50),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'userName',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultformfeild(
                            prefix: Icons.account_circle,
                            suffix: Icons.copy,
                            suffixpressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: userNameStudent.text));
                            },
                            controller: userNameStudent,
                            type: TextInputType.text,
                            validate: (value) {
                              return null;
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'password',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultformfeild(
                            prefix: Icons.lock,
                            controller: passwordStudent,
                            type: TextInputType.text,
                            suffix: Icons.copy,
                            suffixpressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: passwordStudent.text));
                            },
                            validate: (value) {
                              return null;
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'userNameParent',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultformfeild(
                                prefix: Icons.account_circle,
                                controller: userNameParent,
                                type: TextInputType.text,
                                suffix: Icons.copy,
                                suffixpressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: userNameParent.text));
                                },
                                validate: (value) {
                                  return null;
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'passwordParent',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultformfeild(
                                prefix: Icons.lock,
                                controller: passwordParent,
                                type: TextInputType.text,
                                suffix: Icons.copy,
                                suffixpressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: passwordParent.text));
                                },
                                validate: (value) {
                                  return null;
                                }),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
