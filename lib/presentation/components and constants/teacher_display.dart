// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class TeacherShow extends StatelessWidget {
  const TeacherShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:AppColors.borderColor,
          ),
          height: 250,
          width: 300,
          child: Center(
            child: Column(
              children: [
                Spacer(),
                CircleAvatar(
                  radius: 60,
                  foregroundColor: Colors.grey[300],
                  backgroundImage: AssetImage('images/profile.png',),
                ),
                SizedBox(height: 30,),
                Text(
                  'Teacher\'s name',
                  style: TextStyle(fontSize: 20, color: AppColors.darkBlue),
                ),
                Spacer(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
