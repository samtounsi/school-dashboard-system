

import 'package:flutter/material.dart';

import 'constants.dart';

Widget buildSubject(text){
  return  Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
    child: Container(
      child: Text(text,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBlue
        ),
      ),
    ),
  );
}