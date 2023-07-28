// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/cubit.dart';
import 'package:web_schoolapp/data/models/add_time_table_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/add_attendance_screen.dart';
import 'package:web_schoolapp/presentation/screens/time_table.dart';

import '../../business logic/cubits/timetable_cubit/states.dart';


class ChooseGradeAddTableScreen extends StatelessWidget {
  const ChooseGradeAddTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimetableCubit,TimetableStates>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
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
                      TimetableCubit.get(context).showSections(grade: 'seventh').then((value)=>navigateTo(context, Timetable(classValue: 'seventh',)));
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
                      TimetableCubit.get(context).showSections(grade: 'eighth').then((value)=>navigateTo(context, Timetable(classValue: 'eighth',)));
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
                      TimetableCubit.get(context).showSections(grade: 'ninth').then((value)=>navigateTo(context, Timetable(classValue: 'ninth',)));
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
      ),
    );
  }
}
