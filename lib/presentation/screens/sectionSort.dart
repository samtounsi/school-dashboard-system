// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/logComponent.dart';

class SectionSort extends StatelessWidget {
  SectionSort({Key? key}) : super(key: key);
  TextEditingController seventhGradeController = TextEditingController();
  TextEditingController eighthGradeController = TextEditingController();
  TextEditingController ninthGradeController = TextEditingController();
  TextEditingController seventhSectionController = TextEditingController();
  TextEditingController ninthSectionController = TextEditingController();
  TextEditingController eighthSectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    seventhGradeController.text = "Seventh Grade";
    eighthGradeController.text = "Eighth Grade";
    ninthGradeController.text = "Ninth Grade";
    return Scaffold(
      body: Row(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/selectSectionDarkBlue.svg',
                  height: 600,
                  width: 600,
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Distribute Students into Sections',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  defaultformfeild(
                      Width: 200,
                      controller: seventhGradeController,
                      type: TextInputType.text,
                      validate: (value) {}),
                  SizedBox(
                    width: 40,
                  ),
                  defaultWriteFormField(
                      Width: 300,
                      label: 'Number of Section',
                      labelTextColor: AppColors.darkBlue,
                      controller: seventhSectionController,
                      type: TextInputType.text,
                      validate: (value) {})
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  defaultformfeild(
                      Width: 200,
                      controller: eighthGradeController,
                      type: TextInputType.text,
                      validate: (value) {}),
                  SizedBox(
                    width: 40,
                  ),
                  defaultWriteFormField(
                      Width: 300,
                      label: 'Number of Section',
                      labelTextColor: AppColors.darkBlue,
                      controller: eighthSectionController,
                      type: TextInputType.text,
                      validate: (value) {})
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  defaultformfeild(
                      Width: 200,
                      controller: ninthGradeController,
                      type: TextInputType.text,
                      validate: (value) {}),
                  SizedBox(
                    width: 40,
                  ),
                  defaultWriteFormField(
                      Width: 300,
                      label: 'Number of Section',
                      labelTextColor: AppColors.darkBlue,
                      controller: ninthSectionController,
                      type: TextInputType.text,
                      validate: (value) {})
                ],
              ),
              SizedBox(
                height: 60,
              ),
              defaultTextButton(
                  text: 'Sections Sort',
                  function: () {},
                  radius: 35,
                  background: AppColors.darkBlue,
                  textSize: 22),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
