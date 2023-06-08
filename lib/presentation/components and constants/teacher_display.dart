// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class TeacherShow extends StatelessWidget {
  const TeacherShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: CircleAvatar(
            backgroundColor: AppColors.borderColor,
            radius: 150,
          ),
        ),
        Positioned(
          bottom: 120,
          right: 0.0,
          left: 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                foregroundColor: Colors.grey[300],
                backgroundImage: AssetImage('images/profile.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Teacher\'s name',
                style: TextStyle(fontSize: 20, color: AppColors.darkBlue),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
