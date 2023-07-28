// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable, depend_on_referenced_packages, avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit_owner/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit_owner/states.dart';
import 'package:web_schoolapp/data/models/home_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/Calendar.dart';

class HomeScreenOwner extends StatelessWidget {
  HomeScreenOwner();
  String? newHoliday;
  String? newStartSchool;
  String? newEndSchool;
  String? newStartExam;
  String? newEndExam;
  String? newStartReg;
  String? newEndReg;
  HomeModel? homeData;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebHomeCubit, WebHomeStates>(
      listener: (context, state) {
        if (state is WebHomeErrorState) {
          print(state.error.toString());
        } else if (state is WebHomeSuccessfulState) {
          homeData = state.homeModel;
        }
        if (state is WebHomeNewDateErrorState) {
          print(state.error.toString());
        } else if (state is WebHomeNewDateSuccessfulState) {
          print(state.newDateModel!.message);
          WebHomeCubit.get(context).getHomeWebData(
              year: state.newDateModel!.startDate!.year + 1,
              token: token.toString());
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: ConditionalBuilder(
          condition: state is! WebHomeLoadingState,
          builder: (context) => Column(
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
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.grey[200],
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          elevation: 0,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: text('Select Year'),
                                    content: Container(
                                      height: 300,
                                      width: 300,
                                      child: YearPicker(
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2050),
                                          selectedDate:
                                              WebHomeCubit.get(context)
                                                  .selectedDate,
                                          onChanged: (year) {
                                            print(year.year.toString());
                                            WebHomeCubit.get(context)
                                                .getHomeWebData(
                                                    year: year.year + 1,
                                                    token: token.toString());
                                          }),
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                '${WebHomeCubit.get(context)
                                    .selectedDate
                                    .year -1} - ${WebHomeCubit.get(context)
                                    .selectedDate
                                    .year}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      card(
                          title: 'WE HAVE',
                          variable: '${homeData!.numberOfStudents} Students',
                          image: 'images/Student.png'),
                      SizedBox(height: 50),
                      card(
                          title: 'WE HAVE',
                          variable: '${homeData!.numberOfTeachers} Teachers',
                          image: 'images/Teacher.png'),
                      SizedBox(
                        height: 50,
                      ),
                      card(
                          title: 'WE HAVE',
                          variable: '${homeData!.numberOfAdmins}  Staff',
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
                        //calendar
                        child: Container(
                          width: 450,
                          height: 400,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundcolor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: calendar(
                              focusedDay:
                                  DateTime(WebHomeCubit.get(context).selectedDate.year - 1, WebHomeCubit.get(context).selectedDate.month, WebHomeCubit.get(context).selectedDate.day),
                              holidayPredicate: (day) {
                                if (homeData!.holidays!.isEmpty) {
                                  return false;
                                }
                                return WebHomeCubit.get(context).isYearHoliday(
                                    day,
                                    holidays: homeData!.holidays);
                              },
                              selectedDayPredicate: (day) {
                                if (homeData!.workDate!.isEmpty) {
                                  return false;
                                }
                                return WebHomeCubit.get(context).selectPred(day,
                                    startWork: homeData!
                                        .workDate![
                                            homeData!.workDate!.length - 1]
                                        .startDate,
                                    endWork: homeData!
                                        .workDate![
                                            homeData!.workDate!.length - 1]
                                        .endDate);
                              },
                              startRange: homeData!.examDate!.isNotEmpty
                                  ? homeData!
                                      .examDate![homeData!.examDate!.length - 1]
                                      .startDate
                                  : DateTime(1990, 1, 1),
                              endRange: homeData!.examDate!.isNotEmpty
                                  ? homeData!
                                      .examDate![homeData!.examDate!.length - 1]
                                      .endDate
                                  : DateTime(1990, 1, 2),
                              eventLoader: (day) {
                                if (homeData!.registerDate!.isEmpty) {
                                  return [];
                                }
                                return WebHomeCubit.get(context)
                                    .registerEventPred(day,
                                        startRegister: homeData!
                                            .registerDate![
                                                homeData!.registerDate!.length -
                                                    1]
                                            .startDate,
                                        endRegister: homeData!
                                            .registerDate![
                                                homeData!.registerDate!.length -
                                                    1]
                                            .endDate);
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 300,
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
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050))
                                    .then((value) {
                                  print(
                                      '${value!.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}');
                                  newHoliday =
                                      '${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}';
                                  WebHomeCubit.get(context).newDate(
                                      type: 'holiday',
                                      name: 'Holiday',
                                      start_date: newHoliday.toString(),
                                      end_date: newHoliday.toString(),
                                      token: token.toString());
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
                                    'New Holiday',
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
                            width: 10,
                          ),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundcolor,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                showDatePicker(
                                        helpText: 'First day of School',
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050))
                                    .then((value) {
                                  print(
                                      '${value!.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}');
                                  newStartSchool =
                                      '${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}';
                                  showDatePicker(
                                          helpText: 'Last day of School',
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2050))
                                      .then((valueA) {
                                    print(
                                        '${valueA!.year}/${valueA.month.toString().padLeft(2, '0')}/${valueA.day.toString().padLeft(2, '0')}');
                                    newEndSchool =
                                        '${valueA.year}/${valueA.month.toString().padLeft(2, '0')}/${valueA.day.toString().padLeft(2, '0')}';
                                    WebHomeCubit.get(context).newDate(
                                        type: 'work_date',
                                        name: 'Start/End of School',
                                        start_date: newStartSchool.toString(),
                                        end_date: newEndSchool.toString(),
                                        token: token.toString());
                                  });
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home_work,
                                    size: 50,
                                    color: Color.fromARGB(255, 125, 186, 216),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  text(
                                    'Set School Calendar',
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 300,
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
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050))
                                    .then((value) {
                                  print(
                                      '${value!.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}');
                                  newStartExam =
                                      '${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}';
                                  showDatePicker(
                                          helpText: 'Last day of Exam',
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2050))
                                      .then((valueA) {
                                    print(
                                        '${valueA!.year}/${valueA.month.toString().padLeft(2, '0')}/${valueA.day.toString().padLeft(2, '0')}');
                                    newEndExam =
                                        '${valueA.year}/${valueA.month.toString().padLeft(2, '0')}/${valueA.day.toString().padLeft(2, '0')}';
                                    WebHomeCubit.get(context).newDate(
                                        type: 'exam_date',
                                        name: 'Exam',
                                        start_date: newStartExam.toString(),
                                        end_date: newEndExam.toString(),
                                        token: token.toString());
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
                                    'New Exam',
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
                          SizedBox(width: 10),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundcolor,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                showDatePicker(
                                        helpText: 'First day of Registration',
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime(2050))
                                    .then((value) {
                                  print(
                                      '${value!.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}');
                                  newStartReg =
                                      '${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}';
                                  showDatePicker(
                                          helpText: 'Last day of Registration',
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2050))
                                      .then((valueA) {
                                    print(
                                        '${valueA!.year}/${valueA.month}/${valueA.day.toString().padLeft(2, '0')}');
                                    newEndReg =
                                        '${valueA.year}/${valueA.month.toString().padLeft(2, '0')}/${valueA.day.toString().padLeft(2, '0')}';
                                    WebHomeCubit.get(context).newDate(
                                        type: 'register_date',
                                        name: 'Start/End of Registeration',
                                        start_date: newStartReg.toString(),
                                        end_date: newEndReg.toString(),
                                        token: token.toString());
                                  });
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.how_to_reg,
                                    size: 50,
                                    color: AppColors.darkBlue,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  text(
                                    'Set Registeration',
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
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
          fallback: (context) => Row(
            children: [
              Spacer(),
              CircularProgressIndicator(),
              Spacer(),
            ],
          ),
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
