

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'constants.dart';

class HeaderText extends StatelessWidget {
  String text;

  HeaderText({
    Key? key,

    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:AppColors.lightOrange,
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
