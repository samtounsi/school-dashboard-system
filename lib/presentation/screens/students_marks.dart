// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/classes/marks.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/utils.dart';



final columns=['Subject','Max','Monthly test','Final test','Quiz\'s  Prizes'];
List<Marks> marks1=[
  Marks(subject: 'Arabic', max: '400', monthlyTest: '360', finalMark: '380', quizPrize: '?'),
  Marks(subject: 'English', max: '400', monthlyTest: '360', finalMark: '380', quizPrize: '?'),
  Marks(subject: 'French', max: '300', monthlyTest: '260', finalMark: '280', quizPrize: '?'),
  Marks(subject: 'Math', max: '600', monthlyTest: '590', finalMark: '600', quizPrize: '?'),
  Marks(subject: 'Physics', max: '400', monthlyTest: '360', finalMark: '380', quizPrize: '?'),
  Marks(subject: 'Chemistry', max: '400', monthlyTest: '360', finalMark: '380', quizPrize: '?'),
  Marks(subject: 'Social Studies', max: '400', monthlyTest: '360', finalMark: '380', quizPrize: '?'),
  Marks(subject: 'Culture', max: '200', monthlyTest: '200', finalMark: '200', quizPrize: '?'),
  Marks(subject: 'Science', max: '400', monthlyTest: '360', finalMark: '400', quizPrize: '?'),
  Marks(subject: 'Technology', max: '200', monthlyTest: '200', finalMark: '200', quizPrize: '?'),
  Marks(subject: 'Religion', max: '200', monthlyTest: '160', finalMark: '180', quizPrize: '?'),
  Marks(subject: 'Philosophy', max: '200', monthlyTest: '160', finalMark: '200', quizPrize: '?'),
  Marks(subject: 'Art', max: '200', monthlyTest: '200', finalMark: '200', quizPrize: '?'),
  Marks(subject: 'Music', max: '200', monthlyTest: '200', finalMark: '200', quizPrize: '?'),
  Marks(subject: 'Sport', max: '200', monthlyTest: '200', finalMark: '200', quizPrize: '?'),

];
List<Marks> marks2=[
  Marks(subject: 'Arabic', max: '400', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'English', max: '400', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'French', max: '300', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Math', max: '600', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Physics', max: '400', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Chemistry', max: '400', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Social Studies', max: '400', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Culture', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Science', max: '400', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Technology', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Religion', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Philosophy', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Art', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Music', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),
  Marks(subject: 'Sport', max: '200', monthlyTest: '', finalMark: '', quizPrize: ''),

];
class ShowStudentsMarks extends StatelessWidget {
  const ShowStudentsMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 15, end: 15, top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('CERTIFICATION',
                      style: TextStyle(
                          color: AppColors.lightOrange,
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 50,),
                    Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('FIRST SEMESTER',
                                style: TextStyle(
                                    color: AppColors.darkBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 20,),
                              DataTable(
                                columns: getColumns1(columns,),
                                rows: getRows1(marks1),
                                border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                                columnSpacing: 40,
                                dataRowHeight: 60,
                                headingRowColor:
                                MaterialStateColor.resolveWith((states) =>
                                AppColors.lightOrange),
                                // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                              ),
                            ],
                          ),
                          SizedBox(width: 50,),
                          Column(
                            children: [
                              Text('SECOND SEMESTER',
                                style: TextStyle(
                                    color: AppColors.darkBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 20,),
                              DataTable(
                                columns: getColumns2(columns,),
                                rows: getRows2(marks2),
                                border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                                columnSpacing: 40,
                                dataRowHeight: 60,
                                headingRowColor:
                                MaterialStateColor.resolveWith((states) =>
                                AppColors.lightOrange),
                                // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


  List<DataColumn> getColumns1(List<String>columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(column,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.darkBlue
            ),
          )
      );
    }).toList();
  }

  List<DataRow> getRows1(List <Marks> marks) {
    return marks.map(
            (Marks mark) {
          final cells = [
           mark.subject,
            mark.max,
            mark.monthlyTest,
            mark.finalMark,
            mark.quizPrize
          ];
          return DataRow(
              cells: Utils.modelBuilder(cells, (index, cell) {
                return DataCell(
                  Center(
                    child: Text('$cell'
                      , style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                );
              }
              )

          );
        }
    ).toList();
  }


  List<DataColumn> getColumns2(List<String>columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(column,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.darkBlue
            ),
          )
      );
    }).toList();
  }

  List<DataRow> getRows2(List <Marks> marks) {
    return marks.map(
            (Marks mark) {
          final cells = [
            mark.subject,
            mark.max,
            mark.monthlyTest,
            mark.finalMark,
            mark.quizPrize
          ];
          return DataRow(
              cells: Utils.modelBuilder(cells, (index, cell) {
                return DataCell(
                  Center(
                    child: Text('$cell'
                      , style: TextStyle(
                          color: AppColors.darkBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                );
              }
              )

          );
        }
    ).toList();
  }


}
