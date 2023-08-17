// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/presentation/classes/marks.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/utils.dart';
import 'package:web_schoolapp/presentation/screens/layouts/layout1.dart';

import '../../business logic/cubits/student_cubit/cubit.dart';
import '../../business logic/cubits/student_cubit/states.dart';
import '../../business logic/cubits/student_profile/student_profile_cubit.dart';
import '../../business logic/cubits/student_profile/student_profile_state.dart';
import '../../data/models/certificate_model.dart';
import '../components and constants/components.dart';
import '../components and constants/dropdown.dart';


//var model;
final columns=['Subject','Max','Monthly test','Final test','Quiz\'s  Prizes'];
String?yearValue;

class ShowStudentsMarks extends StatelessWidget {
  int id;
   ShowStudentsMarks({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentProfileCubit,StudentProfileState>(
      listener: (context,state)
      {

      },
      builder: (context,state)
      {
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
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                buildDropdown(label: 'Year',
                                    labelColor: AppColors.lightOrange,
                                    list:StudentProfileCubit.get(context).getYearsModel!.years!,
                                    hintText: Text('Select Year',
                                      style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                                    onChanged: (value){
                                      StudentProfileCubit.get(context).changeYear(value!);
                                      yearValue =StudentProfileCubit.get(context).yearValue;
                                    },
                                    maxLength: StudentProfileCubit.get(context).getYearsModel!.years!.length ,
                                    value: yearValue
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Padding(
                                      padding:  EdgeInsetsDirectional.only(start:20,top:40),
                                      child: ConditionalBuilder(
                                        condition: state is ! AppStaffWebGetCertificateLoadingState,
                                        builder:(context)=> defaultTextButton(text: 'show schedule', function: ()
                                        {
                                          StudentProfileCubit.get(context).getCertificate(id: id,year: yearValue);
                                        }, radius: 10, height: 52,textColor: AppColors.darkBlue,
                                            fontWeight: FontWeight.bold,
                                            background: AppColors.borderColor),
                                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                                      ),
                                    ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
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
                                            rows: getRows1(StudentProfileCubit.get(context).certificateModel!.firstSemester!),
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
                                            rows: getRows2(StudentProfileCubit.get(context).certificateModel!.secondSemester!),
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
          },
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

  List<DataRow> getRows1(List <FirstSemester> marks) {
    return marks.map(
            (FirstSemester mark) {
          final cells = [
           mark.subject,
            mark.totalMark,
            mark.marks?.midMarkFirstSemester,
            mark.marks?.midMarkFirstSemester,
            mark.marks?.midMarkFirstSemester
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

  List<DataRow> getRows2(List <SecondSemester> marks) {
    return marks.map(
            (SecondSemester mark) {
          final cells = [
            mark.subject,
            mark.totalMark,
            mark.marks?.midMarkSecondSemester,
            mark.marks?.finalMarkSecondSemester,
            mark.marks?.quizPrizeSecondSemester
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
