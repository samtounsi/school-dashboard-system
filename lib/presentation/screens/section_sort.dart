// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable, file_names, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web_schoolapp/business%20logic/cubits/sort_student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/sort_student_cubit/state.dart';
import 'package:web_schoolapp/data/models/student_sort_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/logComponent.dart';

class SectionSort extends StatelessWidget {
  SectionSort({Key? key}) : super(key: key);
  TextEditingController seventhGradeController = TextEditingController();
  TextEditingController eighthGradeController = TextEditingController();
  TextEditingController ninthGradeController = TextEditingController();
  TextEditingController seventhSectionNumberController =
      TextEditingController();
  TextEditingController ninthSectionNumberController = TextEditingController();
  TextEditingController eighthSectionNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    seventhGradeController.text = "Seventh Grade";
    eighthGradeController.text = "Eighth Grade";
    ninthGradeController.text = "Ninth Grade";
    return BlocConsumer<StudentSortCubit, SortStudentState>(
      listener: (context, state) {
        if(state is SuccessSortStudentState)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 500, vertical: 16),
                    child: Container(
                        height: 80,

                        constraints: const BoxConstraints(maxWidth: 700),
                        decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                           'success sort all students by their GPA',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ));
          }

      },
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Row(
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
                              controller: seventhSectionNumberController,
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
                              controller: eighthSectionNumberController,
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
                              controller: ninthSectionNumberController,
                              type: TextInputType.text,
                              validate: (value) {})
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoadingSortStudentState,
                        builder: (BuildContext context) {
                          return  defaultTextButton(
                              text: 'Sections Sort',
                              function: () {
                                StudentSortModel sort = StudentSortModel(
                                    numberSectionSeventh:
                                    seventhSectionNumberController.text,
                                    numberSectionEighth:
                                    eighthSectionNumberController.text,
                                    numberSectionNinth:
                                    ninthSectionNumberController.text);
                                StudentSortCubit.get(context).sortStudentPost(sort);
                              },
                              radius: 35,
                              background: AppColors.darkBlue,
                              textSize: 22);
                        },
                        fallback: (BuildContext context)=>Center(
                          child: CircularProgressIndicator(),
                        ),

                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
