
import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

Widget buildExamDays(controller,label)
{
  return
    Padding(
      padding: EdgeInsetsDirectional.all(20),
      child: defaultformfeild(
        controller: controller,
        bordercolor: AppColors.darkBlue,
        type: TextInputType.text,
        circular: 10,
        labelTextColor: AppColors.lightOrange,
        Width: 160,

        verticalPadding: 30,
        label: label,
        validate: (value){
          if (value!.isEmpty) {
            return 'This field is required';
          }
          return null;
        },),
    );
}