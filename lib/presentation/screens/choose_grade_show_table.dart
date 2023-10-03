// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/showtimetable.dart';


class ChooseGradeShowTableScreen extends StatefulWidget {
  const ChooseGradeShowTableScreen({super.key});
  @override
  State<ChooseGradeShowTableScreen> createState() => _ChooseGradeShowTableScreenState();
}

class _ChooseGradeShowTableScreenState extends State<ChooseGradeShowTableScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowTimetableCubit,ShowTimetableStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Row(
            children: [
              Spacer(),
              Column(
                children: [
                  Spacer(),
                  text('Choose Grade:', size: 35),
                  Spacer(),
                  defaultTextButton(
                      text: 'Seventh Grade',
                      width: 500,
                      height: 100,
                      function: () {
                        ShowTimetableCubit.get(context).getGrade('seventh');
                        ShowTimetableCubit.get(context).showSections(grade: 'seventh').then((value)
                        {
                          ShowTimetableCubit.get(context).showTimetable(grade: 'seventh',section: '1').then((value) =>
                              navigateTo(context, ShowTimetable(grade: 'seventh',)));

                        }) ;
                      },
                      radius: 20,
                      background: Colors.white,
                      borderColor: AppColors.darkBlue,
                      textColor: AppColors.darkBlue,
                      textSize: 30),
                  Spacer(),
                  defaultTextButton(
                      text: 'Eighth Grade',
                      width: 500,
                      height: 100,
                      function: () {
                        ShowTimetableCubit.get(context).getGrade('eighth');

                        ShowTimetableCubit.get(context).showSections(grade: 'eighth').then((value)
                        {
                          ShowTimetableCubit.get(context).showTimetable(grade: 'eighth',section: '1').then((value)
                          => navigateTo(context, ShowTimetable(grade: 'eighth',)));
                        }) ;
                      },
                      radius: 20,
                      background: Colors.white,
                      borderColor: AppColors.darkBlue,
                      textColor: AppColors.darkBlue,
                      textSize: 30),
                  Spacer(),
                  defaultTextButton(
                      text: 'Ninth Grade',
                      width: 500,
                      height: 100,
                      function: () {
                        ShowTimetableCubit.get(context).getGrade('ninth');

                        ShowTimetableCubit.get(context).showSections(grade: 'ninth').then((value)
                        {
                          ShowTimetableCubit.get(context).showTimetable(grade: 'ninth',section: '1')
                              .then((value) =>  navigateTo(context, ShowTimetable(grade: 'ninth',)));
                        }) ;
                      },
                      radius: 20,
                      background: Colors.white,
                      borderColor: AppColors.darkBlue,
                      textColor: AppColors.darkBlue,
                      textSize: 30),
                  Spacer(),
                  Spacer(),
                ],
              ),
              Spacer(),
              SvgPicture.asset(
                'images/Nerd-amicoAqua.svg',
                width: 600,
                height: 600,
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
