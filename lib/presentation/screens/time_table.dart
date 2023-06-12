
// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/headertext.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/lesson.dart';


var formKey=GlobalKey<FormState>();

TextEditingController sunFirstController = TextEditingController();
TextEditingController sunSecondController = TextEditingController();
TextEditingController sunThirdController = TextEditingController();
TextEditingController sunFourthController = TextEditingController();
TextEditingController sunFifthController = TextEditingController();
TextEditingController sunSixthController = TextEditingController();

TextEditingController munFirstController = TextEditingController();
TextEditingController munSecondController = TextEditingController();
TextEditingController munThirdController = TextEditingController();
TextEditingController munFourthController = TextEditingController();
TextEditingController munFifthController = TextEditingController();
TextEditingController munSixthController = TextEditingController();

TextEditingController tueFirstController = TextEditingController();
TextEditingController tueSecondController = TextEditingController();
TextEditingController tueThirdController = TextEditingController();
TextEditingController tueFourthController = TextEditingController();
TextEditingController tueFifthController = TextEditingController();
TextEditingController tueSixthController = TextEditingController();

TextEditingController wedFirstController = TextEditingController();
TextEditingController wedSecondController = TextEditingController();
TextEditingController wedThirdController = TextEditingController();
TextEditingController wedFourthController = TextEditingController();
TextEditingController wedFifthController = TextEditingController();
TextEditingController wedSixthController = TextEditingController();

TextEditingController thuFirstController = TextEditingController();
TextEditingController thuSecondController = TextEditingController();
TextEditingController thuThirdController = TextEditingController();
TextEditingController thuFourthController = TextEditingController();
TextEditingController thuFifthController = TextEditingController();
TextEditingController thuSixthController = TextEditingController();


List teachers=['Fatima Alkhlif','Sama Tunsi','Nour Ghanem','Abeer Barakat','Yumna Hashem'];
List sections=['1','2','3','4','5','6'];


String classValue = '7th grade';
String sectionValue = '1';
String arabicValue=teachers[0];
String englishValue=teachers[0];
String frenchValue=teachers[0];
String mathValue=teachers[0];
String physicsValue=teachers[0];
String chemistryValue=teachers[0];
String artValue=teachers[0];
String musicValue=teachers[0];
String sportsValue=teachers[0];
String socialValue=teachers[0];
String cultureValue=teachers[0];
String religionValue=teachers[0];
String philosophyValue=teachers[0];
String scienceValue=teachers[0];
String technologyValue=teachers[0];




class Timetable extends StatelessWidget {
  const Timetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TimetableCubit,TimetableStates>(
      listener: (context,state){},
      builder: (context,state)
      {
       return ListView(
         scrollDirection: Axis.vertical,
         children: [
           Center(
             child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Material(
                 child: Padding(
                   padding: EdgeInsetsDirectional.only(start: 50,end: 15,top: 18),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SizedBox(height: 30,),
                       Text('Time table',
                         style: TextStyle(
                             color:AppColors.lightOrange,
                             fontSize: 50,
                             fontWeight: FontWeight.bold
                         ),
                       ),
                       Form(
                         key: formKey,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: EdgeInsetsDirectional.all(10),
                               child: Row(children: [

                                 buildDropdown(
                                     label: 'Class',
                                     list: ['7th grade','8th grade','9th grade'],
                                     onChanged: (value){
                                       TimetableCubit.get(context).changeClass(value!);
                                       classValue = TimetableCubit.get(context).classValue;
                                     } ,
                                     maxLength: 3,
                                     value: classValue),
                                 SizedBox(width: 20,),
                                 buildDropdown(
                                     label: 'Section',
                                     list: sections,
                                     onChanged: (value){
                                       TimetableCubit.get(context).changeSection(value!);
                                       sectionValue = TimetableCubit.get(context).sectionValue;
                                     } ,
                                     maxLength: sections.length,
                                     value: sectionValue)
                               ],),
                             ),
                             Center(
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       HeaderText(text: 'Day'),
                                       HeaderText(text: 'First'),
                                       HeaderText(text: 'Second'),
                                       HeaderText(text: 'Third'),
                                       HeaderText(text: 'Fourth'),
                                       HeaderText(text: 'Fifth'),
                                       HeaderText(text: 'Sixth'),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       HeaderText(text: 'Sun'),
                                       buildLesson(sunFirstController, ''),
                                       buildLesson(sunSecondController, ''),
                                       buildLesson(sunThirdController, ''),
                                       buildLesson(sunFourthController, ''),
                                       buildLesson(sunFifthController, ''),
                                       buildLesson(sunSixthController, ''),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       HeaderText(text: 'Mun'),
                                       buildLesson(munFirstController, ''),
                                       buildLesson(munSecondController, ''),
                                       buildLesson(munThirdController, ''),
                                       buildLesson(munFourthController, ''),
                                       buildLesson(munFifthController, ''),
                                       buildLesson(munSixthController, ''),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       HeaderText(text: 'Tue'),
                                       buildLesson(tueFirstController, ''),
                                       buildLesson(tueSecondController, ''),
                                       buildLesson(tueThirdController, ''),
                                       buildLesson(tueFourthController, ''),
                                       buildLesson(tueFifthController, ''),
                                       buildLesson(tueSixthController, ''),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       HeaderText(text: 'Wed'),
                                       buildLesson(wedFirstController, ''),
                                       buildLesson(wedSecondController, ''),
                                       buildLesson(wedThirdController, ''),
                                       buildLesson(wedFourthController, ''),
                                       buildLesson(wedFifthController, ''),
                                       buildLesson(wedSixthController, ''),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       HeaderText(text: 'Thu'),
                                       buildLesson(thuFirstController, ''),
                                       buildLesson(thuSecondController, ''),
                                       buildLesson(thuThirdController, ''),
                                       buildLesson(thuFourthController, ''),
                                       buildLesson(thuFifthController, ''),
                                       buildLesson(thuSixthController, ''),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 50,),
                             SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       buildDropdown(label: 'Arabic Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeArabicTeacher(value!);
                                             arabicValue = TimetableCubit.get(context).arabicValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: arabicValue
                                       ),

                                       buildDropdown(label: 'English Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeEnglishTeacher(value!);
                                             englishValue = TimetableCubit.get(context).englishValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: englishValue
                                       ),
                                       buildDropdown(label: 'French Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeFrenchTeacher(value!);
                                             frenchValue = TimetableCubit.get(context).frenchValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: frenchValue
                                       ),
                                       buildDropdown(label: 'Math Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeMathTeacher(value!);
                                             mathValue = TimetableCubit.get(context).mathValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: mathValue
                                       ),

                                       buildDropdown(label: 'Physics Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changePhysicsTeacher(value!);
                                             physicsValue = TimetableCubit.get(context).physicsValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: physicsValue
                                       ),

                                     ],
                                   ),
                                   SizedBox(height: 20,),
                                   Row(
                                     children: [
                                       buildDropdown(label: 'Chemistry Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeChemistryTeacher(value!);
                                             chemistryValue = TimetableCubit.get(context).chemistryValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: chemistryValue
                                       ),

                                       buildDropdown(label: 'Art Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeArtTeacher(value!);
                                             artValue = TimetableCubit.get(context).artValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: artValue
                                       ),

                                       buildDropdown(label: 'Music Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeMusicTeacher(value!);
                                             musicValue = TimetableCubit.get(context).musicValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: musicValue
                                       ),
                                       buildDropdown(label: 'Sports Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeSportsTeacher(value!);
                                             sportsValue = TimetableCubit.get(context).sportsValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: sportsValue
                                       ),

                                       buildDropdown(label: 'Social Teacher',
                                           list: teachers,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeSocialTeacher(value!);
                                             socialValue = TimetableCubit.get(context).socialValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: socialValue,
                                           labelColor: AppColors.lightOrange
                                       ),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       buildDropdown(label: 'Culture Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeCultureTeacher(value!);
                                             cultureValue = TimetableCubit.get(context).cultureValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: cultureValue
                                       ),
                                       buildDropdown(label: 'Religion Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeReligionTeacher(value!);
                                             religionValue = TimetableCubit.get(context).religionValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: religionValue
                                       ),
                                       buildDropdown(label: 'Philosophy Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changePhilosophyTeacher(value!);
                                             philosophyValue = TimetableCubit.get(context).philosophyValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: philosophyValue
                                       ),
                                       buildDropdown(label: 'Science Teacher',
                                           list: teachers,
                                           labelColor: AppColors.lightOrange,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeScienceTeacher(value!);
                                             scienceValue = TimetableCubit.get(context).scienceValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: scienceValue
                                       ),
                                       buildDropdown(label: 'Technology Teacher',
                                           labelColor: AppColors.lightOrange,
                                           list: teachers,
                                           onChanged: (value){
                                             TimetableCubit.get(context).changeTechnologyTeacher(value!);
                                             technologyValue = TimetableCubit.get(context).technologyValue!;
                                           },
                                           maxLength: teachers.length,
                                           value: technologyValue
                                       ),

                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 50,),
                             Padding(
                               padding: EdgeInsetsDirectional.symmetric(horizontal: 400),
                               child: defaultTextButton(
                                   text: 'Submit',
                                   function: ()
                                   {
                                     if(formKey.currentState!.validate()){
                                       TimetableCubit.get(context).postTimetable(
                                           grade:TimetableCubit.get(context).classValue ,
                                           section: TimetableCubit.get(context).sectionValue,
                                           sundayLessons: [
                                             'sun',
                                             sunFirstController.text,
                                             sunSecondController.text,
                                             sunThirdController.text,
                                             sunFourthController.text,
                                             sunFifthController.text,
                                             sunSixthController.text],
                                           mondayLessons:['Mun',
                                             munFirstController.text,
                                             munSecondController.text,
                                             munThirdController.text,
                                             munFourthController.text,
                                             munFifthController.text,
                                             munSixthController.text],
                                           tuesdayLessons:['Tue',
                                             tueFirstController.text,
                                             tueSecondController.text,
                                             tueThirdController.text,
                                             tueFourthController.text,
                                             tueFifthController.text,
                                             tueSixthController.text],
                                           wednesdayLessons:[ 'Wed',
                                             wedFirstController.text,
                                             wedSecondController.text,
                                             wedThirdController.text,
                                             wedFourthController.text,
                                             wedFifthController.text,
                                             wedSixthController.text],
                                           thursdayLessons:['Thu',
                                             thuFirstController.text,
                                             thuSecondController.text,
                                             thuThirdController.text,
                                             thuFourthController.text,
                                             thuFifthController.text,
                                             thuSixthController.text],
                                           arabicTeacher: arabicValue,
                                           englishTeacher: englishValue,
                                           frenchTeacher: frenchValue,
                                           mathTeacher: mathValue,
                                           physicsTeacher: physicsValue,
                                           chemistryTeacher: chemistryValue,
                                           artTeacher: artValue,
                                           musicTeacher: musicValue,
                                           sportsTeacher: sportsValue,
                                           socialTeacher: socialValue,
                                           cultureTeacher: cultureValue,
                                           religionTeacher: religionValue,
                                           philosophyTeacher: philosophyValue,
                                           scienceTeacher: scienceValue,
                                           technologyTeacher: technologyValue
                                       );
                                     }
                                   },
                                   radius: 30,
                                   textSize: 20,
                                   textColor: AppColors.darkBlue,
                                   fontWeight: FontWeight.bold,
                                   background: AppColors.lightOrange
                               ),
                             ),

                             SizedBox(height: 50,),
                           ],
                         ),
                       )
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

}







