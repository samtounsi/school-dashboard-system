// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable, depend_on_referenced_packages, avoid_print, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit_staff/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit_staff/states.dart';
import 'package:web_schoolapp/data/models/home_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/Calendar.dart';

class HomeScreenStaff extends StatelessWidget {
  HomeScreenStaff();
  HomeModel? homeDataStaff;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebHomeStaffCubit, WebHomeStaffStates>(
      listener: (context, state) {
        if (state is GetStaffHomeDataErrorState) {
          print(state.error.toString());
        } else if (state is GetStaffHomeDataSuccessState) {
          homeDataStaff = state.homeSmodel;
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: ConditionalBuilder(
          condition: state is! GetStaffHomeDataLoadingState,
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
                        height: 30,
                      ),
                      card(
                          title: 'WE HAVE',
                          variable: '${homeDataStaff!.numberOfStudents} Students',
                          image: 'images/Student.png'),
                      SizedBox(height: 50),
                      card(
                          title: 'WE HAVE',
                          variable: '${homeDataStaff!.numberOfTeachers} Teachers',
                          image: 'images/Teacher.png'),
                      SizedBox(
                        height: 50,
                      ),
                      card(
                          title: 'WE HAVE',
                          variable: '${homeDataStaff!.numberOfAdmins}  Staff',
                          image: 'images/Admin.png'),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 450,
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
                                    title: text('Select First School Year'),
                                    content: Container(
                                      height: 300,
                                      width: 300,
                                      child: YearPicker(
                                          firstDate: DateTime(1990),
                                          lastDate: DateTime(2050),
                                          selectedDate:
                                              WebHomeStaffCubit.get(context)
                                                  .selectedDate,
                                          onChanged: (year) {
                                            print(year.year.toString());
                                            WebHomeStaffCubit.get(context)
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
                                '${WebHomeStaffCubit.get(context).selectedDate.year - 1} - ${WebHomeStaffCubit.get(context)
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

                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 10),
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
                                  DateTime(WebHomeStaffCubit.get(context).selectedDate.year - 1, WebHomeStaffCubit.get(context).selectedDate.month, WebHomeStaffCubit.get(context).selectedDate.day),
                              holidayPredicate: (day) {
                                if (homeDataStaff!.holidays!.isEmpty) {
                                  return false;
                                }
                                return WebHomeStaffCubit.get(context).isYearHoliday(
                                    day,
                                    holidays: homeDataStaff!.holidays);
                              },
                              selectedDayPredicate: (day) {
                                if (homeDataStaff!.workDate!.isEmpty) {
                                  return false;
                                }
                                return WebHomeStaffCubit.get(context).selectPred(day,
                                    startWork: homeDataStaff!
                                        .workDate![
                                            homeDataStaff!.workDate!.length - 1]
                                        .startDate,
                                    endWork: homeDataStaff!
                                        .workDate![
                                            homeDataStaff!.workDate!.length - 1]
                                        .endDate);
                              },
                              startRange: homeDataStaff!.examDate!.isNotEmpty
                                  ? homeDataStaff!
                                      .examDate![homeDataStaff!.examDate!.length - 1]
                                      .startDate
                                  : DateTime(1990, 1, 1),
                              endRange: homeDataStaff!.examDate!.isNotEmpty
                                  ? homeDataStaff!
                                      .examDate![homeDataStaff!.examDate!.length - 1]
                                      .endDate
                                  : DateTime(1990, 1, 2),
                              eventLoader: (day) {
                                if (homeDataStaff!.registerDate!.isEmpty) {
                                  return [];
                                }
                                return WebHomeStaffCubit.get(context)
                                    .registerEventPred(day,
                                        startRegister: homeDataStaff!
                                            .registerDate![
                                                homeDataStaff!.registerDate!.length -
                                                    1]
                                            .startDate,
                                        endRegister: homeDataStaff!
                                            .registerDate![
                                                homeDataStaff!.registerDate!.length -
                                                    1]
                                            .endDate);
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width:420,
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.aqua,
                                shape: BoxShape.circle,
                              ),
                      
                            ),
                            SizedBox(width:7),
                            text('Holidays', size: 26, color: Colors.black),
                          ],
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        width: 420,
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.lightOrange,
                                shape: BoxShape.circle,
                              ),
                      
                            ),
                            SizedBox(width:7),
                            text('Exam Period', size: 26, color: Colors.black),
                          ],
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        width: 420,
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 125, 186, 216),
                                shape: BoxShape.circle,
                              ),
                      
                            ),
                            SizedBox(width:7),
                            text('Start/End of School', size: 26, color: Colors.black),
                          ],
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        width: 420,
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                shape: BoxShape.rectangle,
                              ),
                      
                            ),
                            SizedBox(width:7),
                            text('Start/End of Registeration', size: 26, color: Colors.black),
                          ],
                        ),
                      )
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
