// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/Calendar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();
  @override
  Widget build(BuildContext context) {
    String newHoliday;
    String newStart;
    String newEnd;
    return BlocConsumer<WebHomeCubit, WebHomeStates>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 20),
                  child: text(
                    'HOGWARTS SCHOOL',
                    color: AppColors.lightOrange,
                    weight: FontWeight.bold,
                    size: 45,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 50,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    card(
                        title: 'WE HAVE',
                        variable: '25 Students',
                        image: 'images/Student.png'),
                    SizedBox(height: 50),
                    card(
                        title: 'WE HAVE',
                        variable: '3 Teachers',
                        image: 'images/Teacher.png'),
                    SizedBox(
                      height: 50,
                    ),
                    card(
                        title: 'WE HAVE',
                        variable: '5  Staff',
                        image: 'images/Admin.png'),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 80),
                      child: Container(
                        width: 450,
                        height: 400,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundcolor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: calendar(
                          holidayPredicate: (day) {
                            return WebHomeCubit.get(context).isHoliday(day) ||
                                WebHomeCubit.get(context).isYearHoliday(day);
                          },
                          startRange: WebHomeCubit.get(context).startExam,
                          endRange: WebHomeCubit.get(context).endExam,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 100,
                      width: 450,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundcolor,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          showDatePicker(
                                  helpText: 'Choose Holiday',
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            print(DateFormat.yMMMd().format(value!));
                            newHoliday = DateFormat.yMMMd().format(value);
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 50,
                              color: AppColors.darkAqua,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            text(
                              'Add Holiday',
                              size: 24,
                            ),
                          ],
                        ),
                        minWidth: 500,
                        height: 100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 450,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundcolor,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          showDatePicker(
                                  helpText: 'First day of Exam',
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2050))
                              .then((value) {
                            print(DateFormat.yMMMd().format(value!));
                            newStart = DateFormat.yMMMd().format(value);
                            showDatePicker(
                                    helpText: 'Last day of Exam',
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2050))
                                .then((value) {
                              print(DateFormat.yMMMd().format(value!));
                              newEnd = DateFormat.yMMMd().format(value);
                            });
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 50,
                              color: AppColors.lightOrange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            text(
                              'Edit Exam Range',
                              size: 24,
                            ),
                          ],
                        ),
                        minWidth: 500,
                        height: 100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  Widget card({
    required String title,
    required String variable,
    Color color = AppColors.aqua,
    required String image,
  }) {
    return Container(
      height: 150,
      width: 420,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        //border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              height: 100,
              width: 100,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(
                    title,
                    size: 20,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  text(
                    variable,
                    size: 34,
                  )
                ]),
          ],
        ),
      ),
    );
  }
}
