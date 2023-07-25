
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/logComponent.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/models/registerModel.dart';
class UserNamePasswordScreen extends StatelessWidget {
  RegisterModel? registerModel;
  UserNamePasswordScreen({this.registerModel});
  TextEditingController id = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userNameParent = TextEditingController();
  TextEditingController passwordParent = TextEditingController();
  bool? navigate = false;

  @override
  Widget build(BuildContext context) {
    id.text=" ${registerModel?.id}";
    userName.text =" ${registerModel?.username}";
    password.text = " ${registerModel?.password}";
    userNameParent.text = " "
        "${registerModel?.parentUsername}";
    passwordParent.text = " ${registerModel?.parentPassword}";
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
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
                padding: const EdgeInsets.only(right: 110, top: 50),
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
                          'Id',
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
                                  ClipboardData(text: id.text));
                              Fluttertoast.showToast(msg: 'copied',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0
                              );
                            },
                            controller: id,
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
                                  ClipboardData(text: userName.text));
                              Fluttertoast.showToast(msg: 'copied',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0
                              );
                            },
                            controller: userName,
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
                            controller: password,
                            type: TextInputType.text,
                            suffix: Icons.copy,
                            suffixpressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: password.text));
                              Fluttertoast.showToast(msg: 'copied',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0
                              );
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
                                  Fluttertoast.showToast(msg: 'copied',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0,

                                  );
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
                                  Fluttertoast.showToast(msg: 'copied',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0
                                  );
                                },
                                validate: (value) {
                                  return null;
                                }),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    // Spacer(),
                  ],
                ),
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
