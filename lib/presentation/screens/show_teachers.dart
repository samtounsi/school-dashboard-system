// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/teacher_display.dart';
import 'package:web_schoolapp/presentation/screens/teacher_profile.dart';

import '../components and constants/components.dart';

class TeachersDisplay extends StatelessWidget {
  const TeachersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: Text('Teachers'),
        ),
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:4,
              crossAxisSpacing: 35,
              mainAxisSpacing:35,
            ),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: (
                      ){
                        navigateTo(context, TeacherProfile());
                  },
                  child:TeacherShow()
              );
            },
          ),
        ));
  }
}
