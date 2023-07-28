// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/states.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/states.dart';
import 'package:web_schoolapp/presentation/classes/lessons.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/subject_text.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/utils.dart';

import '../../data/models/get_timetable_model.dart';


 String classValue = 'seventh';
String sectionValue = '1';

final columns = ['Day', '1', '2', '3', '4', '5', '6'];
var model;
class ShowTimetable extends StatelessWidget {
  String grade;
  ShowTimetable({super.key, required this.grade});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowTimetableCubit, ShowTimetableStates>(
      listener: (context, state)
      {
        if(state is AppShowTimetableSuccessState)
        {
           model=state.getTimetableModel.daysLessons;

           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Padding(
               padding: EdgeInsetsDirectional.symmetric(horizontal: 550,vertical: 16),

               child: Container(
                   height: 50,
                   constraints: const BoxConstraints(maxWidth: 400),
                   decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
                   child: Center(
                     child: Text(state.getTimetableModel.message.toString(),
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(color: AppColors.darkBlue,fontSize: 20,fontWeight: FontWeight.bold),),
                   )),
             ),
               behavior: SnackBarBehavior.floating,
               backgroundColor: Colors.transparent,
               elevation: 0,
             ),
           );
        }
        if(state is GetTimetableEmptyState)
        {
          model=state.getTimetableModel.daysLessons;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 550,vertical: 16),

              child: Container(
                  height: 50,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(state.getTimetableModel.message.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.darkBlue,fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
            ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition:ShowTimetableCubit.get(context).showSection!=null,
          builder: (context)
          {
            model=ShowTimetableCubit.get(context).showTimetableModel!.daysLessons==null?
            ShowTimetableCubit.get(context).emptyTable!.daysLessons
            :ShowTimetableCubit.get(context).showTimetableModel!.daysLessons;
            return Scaffold(
              body: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Card(
                        elevation: 0,
                        borderOnForeground: false,
                        color: Colors.transparent,
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.only(start: 15, end: 15, top: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(start: 500.0,end:250),
                                        child: Text(
                                          'Time table',
                                          style: TextStyle(
                                              color: AppColors.lightOrange,
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top:20.0),
                                            child: buildDropdown(label: 'Sections',
                                                list: ShowTimetableCubit.get(context).showSection!.sectionNumbers!,
                                                onChanged: (value){
                                                  ShowTimetableCubit.get(context).changeSection(value!);
                                                  sectionValue = ShowTimetableCubit.get(context).sectionValue;
                                                },
                                                maxLength:  ShowTimetableCubit.get(context).showSection!.sectionNumbers!.length,
                                                value: sectionValue
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ConditionalBuilder(
                                            condition:state is !AppShowTimetableLoadingState,
                                            builder:(context)
                                            {
                                              return  Padding(
                                                padding: const EdgeInsets.only(top:55.0),
                                                child: defaultTextButton(
                                                    text: 'show table',
                                                    function: () {
                                                      ShowTimetableCubit.get(context).showTimetable(grade: grade,section: sectionValue);
                                                    },
                                                    radius: 10,
                                                    height: 52,
                                                    textSize: 20,
                                                    textColor: AppColors.darkBlue,
                                                    fontWeight: FontWeight.bold,
                                                    background: AppColors.borderColor),
                                              );
                                            }
                                            ,
                                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                                          ),
                                        ],
                                      ),
                                      DataTable(
                                        columns: getColumns(columns),
                                        rows: getRows(model),
                                        border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                                        columnSpacing: ShowTimetableCubit.get(context).showTimetableModel!.exist==0? 80 : 20,
                                        dataRowHeight: 80,
                                        headingRowColor: MaterialStateColor.resolveWith(
                                                (states) => AppColors.lightOrange),
                                        // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'images/Time management-pana.svg',
                                          width: 300.0,
                                          height: 300.0,
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 50),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                children: [
                                                  buildSubject('Arabic:Ar'),
                                                  buildSubject('English:E'),
                                                  buildSubject('French:F'),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  buildSubject('Art: A'),
                                                  buildSubject('Music:Mu'),
                                                  buildSubject('Sport:Sp')
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  buildSubject('Science:S'),
                                                  buildSubject('Technology:T'),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  buildSubject('Math:M'),
                                                  buildSubject('Physics:P'),
                                                  buildSubject('Chemistry:Ch'),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  buildSubject('Social studies: Soc'),
                                                  buildSubject('Culture:C'),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  buildSubject('Religion:R'),
                                                  buildSubject('philosophy:Ph'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
          },

        );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Text(
          column,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.darkBlue),
        ),
      ));
    }).toList();
  }

  List<DataRow> getRows(List<DaysLessons> lessons) {
    return lessons.map((DaysLessons lesson) {
      final cells = [
        lesson.day,
        lesson.first,
        lesson.second,
        lesson.third,
        lesson.fourth,
        lesson.fifth,
        lesson.sixth
      ];
      return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
        return DataCell(
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            child: Center(
              child: Text(
                '$cell',
                style: TextStyle(
                    color: AppColors.darkBlue, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      }));
    }).toList();
  }
}
