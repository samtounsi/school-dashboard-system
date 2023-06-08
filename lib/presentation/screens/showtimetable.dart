// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/states.dart';
import 'package:web_schoolapp/presentation/classes/lessons.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/subject_text.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/utils.dart';



String classValue = '7th grade';
String sectionValue = 'section 1';
List sections = [
  'section 1',
  'section 2',
  'section 3',
  'section 4',
  'section 5',
  'section 6'
];
final columns = ['Day', '1', '2', '3', '4', '5', '6'];

class ShowTimetable extends StatelessWidget {
  const ShowTimetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowTimetableCubit, ShowTimetableStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Card(
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 15, end: 15, top: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Time table',
                    style: TextStyle(
                        color: AppColors.lightOrange,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 60),
                    child: Row(
                      children: [
                        buildDropdown(
                            label: 'Class',
                            list: ['7th grade', '8th grade', '9th grade'],
                            onChanged: (value) {
                              ShowTimetableCubit.get(context)
                                  .changeClass(value!);
                              classValue =
                                  ShowTimetableCubit.get(context).classValue;
                            },
                            maxLength: 3,
                            value: classValue),
                        SizedBox(
                          width: 20,
                        ),
                        buildDropdown(
                            // dropDownValueText: 'select section',
                            label: 'Section',
                            list: sections,
                            onChanged: (value) {
                              ShowTimetableCubit.get(context)
                                  .changeSection(value!);
                              sectionValue = ShowTimetableCubit.get(context)
                                  .sectionValue;
                            },
                            maxLength: sections.length,
                            value: sectionValue),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 40),
                          child: defaultTextButton(
                              text: 'show table',
                              function: () {
                                ShowTimetableCubit.get(context).getTable(
                                    grade: classValue, section: sectionValue);
                              },
                              radius: 10,
                              height: 52,
                              textSize: 20,
                              textColor: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                              background: AppColors.borderColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DataTable(
                        columns: getColumns(columns),
                        rows: getRows(ShowTimetableCubit.get(context).lesson),
                        border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                        columnSpacing: 80,
                        dataRowHeight: 80,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.lightOrange),
                        // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
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
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
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

  List<DataRow> getRows(List<Lessons> lessons) {
    return lessons.map((Lessons lesson) {
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
