
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../business logic/cubits/exam_schedule_cubit/cubit.dart';
import '../../business logic/cubits/exam_schedule_cubit/states.dart';
import '../../data/models/exam_model.dart';
import '../components and constants/components.dart';
import '../components and constants/constants.dart';
import '../components and constants/dropdown.dart';
import '../components and constants/utils.dart';

final columns = ['Subject', 'Date', 'Period'];
String? classValue;
String? semesterValue;
var model;



class ExamSchedule extends StatelessWidget {
  const ExamSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamCubit,ExamStates>(
      listener: (context,state)
      {
        if(state is ExamGetExamScheduleSuccessState)
        {
          model=state.examScheduleModel;
        }
      },
      builder: (context,state)
      {
        if(state is ExamGetExamScheduleSuccessState)
        {
          model=state.examScheduleModel;
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
           width: double.infinity,
            child: Scaffold(
              appBar:AppBar(
                backgroundColor: Colors.transparent,
                   elevation: 0,
                   titleSpacing: 0,
                   title: Padding(
                     padding: const EdgeInsets.only(left:50.0,),
                     child: Text(
                        'Exam Schedule',
                        style: TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                   ),
                ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            buildDropdown(label: 'Semester',
                                labelColor: AppColors.lightOrange,
                                list: ['1','2'],
                                hintText: Text('Select Semester',
                                  style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                                onChanged: (value){
                                   ExamCubit.get(context).changeSemester(value!);
                                  semesterValue = ExamCubit.get(context).semesterValue;
                                },
                                maxLength:  2,
                                value: semesterValue
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            buildDropdown(label: 'Grade',
                                labelColor: AppColors.lightOrange,
                                list: ['seventh','eighth','ninth'],
                                hintText: Text('Select Grade',
                                  style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                                onChanged: (value){
                                   ExamCubit.get(context).changeGrade(value!);
                                  classValue = ExamCubit.get(context).classValue;
                                },
                                maxLength:  3,
                                value: classValue
                            ),
                            ConditionalBuilder(
                              condition:state is ! ExamGetExamScheduleLoadingState,
                              builder:(context)
                              {
                                return  Padding(
                                  padding:  EdgeInsetsDirectional.only(start:20,top:40),
                                  child: defaultTextButton(text: 'show schedule', function: ()
                                  {
                                    ExamCubit.get(context).getExamSchedule(grade: classValue,semester: semesterValue);
                                  }, radius: 10, height: 52,textColor: AppColors.darkBlue,
                                      fontWeight: FontWeight.bold,
                                      background: AppColors.borderColor),
                                );
                              }
                              ,
                              fallback: (context)=>Center(child: CircularProgressIndicator()),
                            )
                          ],
                        ),
                      ),
                    ),
                      SizedBox(
                            height: 20,
                          ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 50.0),
                           child: DataTable(
                             columns: getColumns(columns),
                             rows: getRows(ExamCubit.get(context).examScheduleModel!.examsList!,context),
                             border: TableBorder.all(width: 1, color: AppColors.darkBlue),
                             columnSpacing:ExamCubit.get(context).examScheduleModel!.examsList?.length !=0? 300:30,
                             headingRowColor: MaterialStateColor.resolveWith(
                                     (states) => AppColors.lightOrange),
                             // dataRowColor: MaterialStateColor.resolveWith((states) => AppColors.lightOrange),
                           ),
                         ),
                         Column(
                           children: [
                             Center(
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(
                                       'Education is the most ',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25,
                                           color: AppColors.aqua),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(
                                       'powerful weapon which you',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25,
                                           color: AppColors.aqua),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(
                                       ' can use to change the world',
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 25,
                                           color: AppColors.aqua),
                                     ),
                                   ),
      Padding(
      padding: const EdgeInsets.only(bottom: 8.0,right: 8,top: 8,left:150 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
          'Nelson Mandela',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.lightOrange),
          ),
        ],
      ),)
                                 ],
                               ),
                             ),
                             SvgPicture.asset(
                               'images/college entrance exam-amico.svg',
                               width: 300.0,
                               height:300.0,
                             ),
                           ],
                         ),
                       ],
                     )
                  ],
                ),
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
          label: Text(
            column,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.darkBlue),
          ));
    }).toList();
  }

  List<DataRow> getRows(List<ExamsList> exams,context) {
    return exams.map((ExamsList exam) {
      final cells = [
        exam.subject,
        exam.date.toString().substring(0,10)
        ,
        exam.period,
      ];
      return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(Text(
              '$cell',
              style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ));
          }));
    }).toList();
  }
}


