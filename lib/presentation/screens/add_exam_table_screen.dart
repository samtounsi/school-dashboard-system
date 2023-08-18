import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:web_schoolapp/business%20logic/cubits/exam_table_cubit/cubit.dart';
import 'package:web_schoolapp/data/models/exam_table_model_send.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/exams_day.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/subject_text.dart';
import '../../business logic/cubits/exam_schedule_cubit/cubit.dart';
import '../../business logic/cubits/exam_table_cubit/state.dart';
import '../components and constants/headertext_examtable.dart';
import 'exam_schedule.dart';

var formKey = GlobalKey<FormState>();

TextEditingController dateFirstController = TextEditingController();
TextEditingController subjectFirstController = TextEditingController();
TextEditingController timeFirstController = TextEditingController();

TextEditingController dateSecondController = TextEditingController();
TextEditingController subjectSecondController = TextEditingController();
TextEditingController timeSecondController = TextEditingController();

TextEditingController dateThirdController = TextEditingController();
TextEditingController subjectThirdController = TextEditingController();
TextEditingController timeThirdController = TextEditingController();

TextEditingController dateFourthController = TextEditingController();
TextEditingController subjectFourthController = TextEditingController();
TextEditingController timeFourthController = TextEditingController();

TextEditingController dateFifthController = TextEditingController();
TextEditingController subjectFifthController = TextEditingController();
TextEditingController timeFifthController = TextEditingController();

TextEditingController dateSixthController = TextEditingController();
TextEditingController subjectSixthController = TextEditingController();
TextEditingController timeSixthController = TextEditingController();

TextEditingController dateSeventhController = TextEditingController();
TextEditingController subjectSeventhController = TextEditingController();
TextEditingController timeSeventhController = TextEditingController();

TextEditingController dateEighthController = TextEditingController();
TextEditingController subjectEighthController = TextEditingController();
TextEditingController timeEighthController = TextEditingController();

TextEditingController dateNinthController = TextEditingController();
TextEditingController subjectNinthController = TextEditingController();
TextEditingController timeNinthController = TextEditingController();

TextEditingController dateTenthController = TextEditingController();
TextEditingController subjectTenthController = TextEditingController();
TextEditingController timeTenthController = TextEditingController();

TextEditingController dateEleventhController = TextEditingController();
TextEditingController subjectEleventhController = TextEditingController();
TextEditingController timeEleventhController = TextEditingController();

TextEditingController dateTwelfthController = TextEditingController();
TextEditingController subjectTwelfthController = TextEditingController();
TextEditingController timeTwelfthController = TextEditingController();
String? classAddValue;
int? semesterAddValue;



class ExamTableScreen extends StatelessWidget {
  ExamTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddExamTableCubit,ExamTableState>(
      builder: (context, state) {
        return SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 15,
                  end: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Add Exam Table',
                            style: TextStyle(
                                color: AppColors.aqua,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                buildDropdown(label: 'Semester',
                                    labelColor: AppColors.aqua,
                                    list: [1,2],
                                    hintText: Text('Select Semester',
                                      style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                                    onChanged: (value){
                                      AddExamTableCubit.get(context).changeSemesterAddExamTable(value!);
                                      semesterAddValue = AddExamTableCubit.get(context).semesterValueAddExamTable;
                                    },
                                    maxLength:  2,
                                    value: semesterAddValue
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                buildDropdown(label: 'Grade',
                                    labelColor: AppColors.aqua,
                                    list: ['seventh','eighth','ninth'],
                                    hintText: Text('Select Grade',
                                      style: TextStyle(fontSize: 15,color: AppColors.darkBlue),),
                                    onChanged: (value){
                                      AddExamTableCubit.get(context).changeGradeAddExamTable(value!);
                                      classAddValue = AddExamTableCubit.get(context).classValueAddExam;
                                    },
                                    maxLength:  3,
                                    value: classAddValue
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: 'Day'),
                                      HeaderExamTableText(text: 'Date'),
                                      HeaderExamTableText(text: 'Subject'),
                                      HeaderExamTableText(text: 'Time')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '1'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateFirstController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateFirstController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectFirstController, ''),
                                      buildExamDays(timeFirstController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '2'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateSecondController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateSecondController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectSecondController, ''),
                                      buildExamDays(timeSecondController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '3'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateThirdController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateThirdController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectThirdController, ''),
                                      buildExamDays(timeThirdController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '4'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateFourthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateFourthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectFourthController, ''),
                                      buildExamDays(timeFourthController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '5'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateFifthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateFifthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectFifthController, ''),
                                      buildExamDays(timeFifthController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '6'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateSixthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateSixthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectSixthController, ''),
                                      buildExamDays(timeSixthController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '7'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateSeventhController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateSeventhController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectSeventhController, ''),
                                      buildExamDays(timeSeventhController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '8'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateEighthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateEighthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectEighthController, ''),
                                      buildExamDays(timeEighthController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '9'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateNinthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateNinthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectNinthController, ''),
                                      buildExamDays(timeNinthController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '10'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateTenthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateTenthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectTenthController, ''),
                                      buildExamDays(timeTenthController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '11'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateEleventhController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateEleventhController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectEleventhController, ''),
                                      buildExamDays(timeEleventhController, ''),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      HeaderExamTableText(text: '12'),
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(20),
                                        child: Container(
                                            width: 160,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColors.darkBlue, width: 1)),
                                            child: TextField(
                                              controller: dateTwelfthController,
                                              decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 30, horizontal: 30),
                                                  border: OutlineInputBorder(),
                                                  labelStyle: TextStyle(
                                                    color: AppColors.darkBlue,
                                                  ) //label text of field
                                              ),
                                              readOnly: true,
                                              //set it true, so that user will not able to edit text
                                              onTap: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050))
                                                    .then((value) {
                                                  print(DateFormat('yyyy/MM/dd')
                                                      .format(value!));
                                                  dateTwelfthController.text =
                                                      DateFormat('yyyy/MM/dd')
                                                          .format(value);
                                                });
                                              },
                                            )),
                                      ),
                                      buildExamDays(subjectTwelfthController, ''),
                                      buildExamDays(timeTwelfthController, ''),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'images/college entrance exam-rafiki (1).svg',
                                    width: 400.0,
                                    height: 400.0,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      buildSubject('Arabic'),
                                      buildSubject('English'),
                                      buildSubject('French'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      buildSubject('Math'),
                                      buildSubject('Technology'),
                                      buildSubject('Science'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      buildSubject('Physics'),
                                      buildSubject('Chemistry'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      buildSubject('Social studies'),
                                      buildSubject('Culture'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      buildSubject('philosophy'),
                                      buildSubject('Religion'),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          BlocConsumer<AddExamTableCubit, ExamTableState>(
                            builder: (context, state) {
                              return ConditionalBuilder(
                                condition: state is! ExamTableAddLoadingState,
                                builder: (BuildContext context) {
                                  return defaultTextButton(
                                      text: 'Submit',
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          ExamTableSendModel model = ExamTableSendModel(
                                            grade: classAddValue,
                                            semester: semesterAddValue,
                                            first: [
                                              dateFirstController.text,
                                              subjectFirstController.text,
                                              timeFirstController.text,
                                            ],
                                            second: [
                                              dateSecondController.text,
                                              subjectSecondController.text,
                                              timeSecondController.text,
                                            ],
                                            third: [
                                              dateThirdController.text,
                                              subjectThirdController.text,
                                              timeThirdController.text,
                                            ],
                                            fourth: [
                                              dateFourthController.text,
                                              subjectFourthController.text,
                                              timeFourthController.text,
                                            ],
                                            fifth: [
                                              dateFifthController.text,
                                              subjectFifthController.text,
                                              timeFifthController.text,
                                            ],
                                            sixth: [
                                              dateSixthController.text,
                                              subjectSixthController.text,
                                              timeSixthController.text,
                                            ],
                                            seventh: [
                                              dateSeventhController.text,
                                              subjectSeventhController.text,
                                              timeSeventhController.text,
                                            ],
                                            eighth: [
                                              dateEighthController.text,
                                              subjectEighthController.text,
                                              timeEighthController.text,
                                            ],
                                            ninth: [
                                              dateNinthController.text,
                                              subjectNinthController.text,
                                              timeNinthController.text,
                                            ],
                                            tenth: [
                                              dateTenthController.text,
                                              subjectTenthController.text,
                                              timeTenthController.text,
                                            ],
                                            eleventh: [
                                              dateEleventhController.text,
                                              subjectEleventhController.text,
                                              timeEleventhController.text,
                                            ],
                                            twelfth: [
                                              dateTwelfthController.text,
                                              subjectTwelfthController.text,
                                              timeTwelfthController.text,
                                            ],
                                          );
                                          AddExamTableCubit.get(context)
                                              .postExamTable(data: model);

                                          print(model.toJson(model).toString());
                                        }
                                      },
                                      radius: 30,
                                      textSize: 20,
                                      textColor: AppColors.darkBlue,
                                      fontWeight: FontWeight.bold,
                                      background: AppColors.aqua);
                                },
                                fallback: (BuildContext context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            listener: (context, state) {},
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
      listener: (context, state) {},
    );
  }
}
