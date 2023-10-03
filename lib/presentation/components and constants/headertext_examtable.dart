

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'constants.dart';


class HeaderExamTableText extends StatelessWidget {
  String text;

  HeaderExamTableText({
    Key? key,

    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 20,start: 20,end: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:AppColors.aqua,
              border:  Border.all(color: AppColors.darkBlue),
              borderRadius: BorderRadius.circular(10),

            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBlue,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
