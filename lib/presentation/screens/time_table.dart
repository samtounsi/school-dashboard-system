
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';


import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/states.dart';
import 'package:web_schoolapp/data/models/show_sections.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/headertext.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/lesson.dart';

import '../../data/models/add_time_table_model.dart';


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


String? sectionValue='1';

class Timetable extends StatelessWidget {
  String classValue;
 Timetable({super.key,required this.classValue});

@override
Widget build(BuildContext context) {
return  BlocConsumer<TimetableCubit,TimetableStates>(
listener: (context,state)
{

  if(state is AppShowSectionsErrorState)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

        child: Container(
            height: 50,
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(state.error.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            )),
      ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
  if(state is AppShowTeachersSubjectsErrorState)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

        child: Container(
            height: 50,
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(state.error.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            )),
      ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
  if(state is AppAddTimetableSuccessState)

    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

          child: Container(
              height: 50,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(state.addTimetableResponse.message.toString(),
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
  else if(state is AppAddTimetableErrorState)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

          child: Container(
              height: 50,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Text(state.error.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              )),
        ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }

},
builder: (context,state)
{

return SingleChildScrollView(
child: ConditionalBuilder(
      condition:TimetableCubit.get(context).showSection!=null&& TimetableCubit.get(context).teacherSubjectModel!=null&&
    TimetableCubit.get(context).teacherEnglishSubjectModel!=null&&TimetableCubit.get(context).teacherFrenchSubjectModel!=null&&
    TimetableCubit.get(context).teacherMathSubjectModel!=null&&TimetableCubit.get(context).teacherPhysicsSubjectModel!=null&&
    TimetableCubit.get(context).teacherChemistrySubjectModel!=null&&TimetableCubit.get(context).teacherArtSubjectModel!=null&&
    TimetableCubit.get(context).teacherMusicSubjectModel!=null&&TimetableCubit.get(context).teacherSportsSubjectModel!=null&&
    TimetableCubit.get(context).teacherSocialSubjectModel!=null&&TimetableCubit.get(context).teacherCultureSubjectModel!=null&&
    TimetableCubit.get(context).teacherReligionSubjectModel!=null&&TimetableCubit.get(context).teacherPhilosophySubjectModel!=null&&
    TimetableCubit.get(context).teacherScienceSubjectModel!=null&&TimetableCubit.get(context).teacherTechnologySubjectModel!=null
      ,builder: (context)
      {
        String arabicValue=TimetableCubit.get(context).teacherSubjectModel!.teachers![0];
        String englishValue=TimetableCubit.get(context).teacherEnglishSubjectModel!.teachers![0];
        String frenchValue=TimetableCubit.get(context).teacherFrenchSubjectModel!.teachers![0];
        String mathValue=TimetableCubit.get(context).teacherMathSubjectModel!.teachers![0];
        String physicsValue=TimetableCubit.get(context).teacherPhysicsSubjectModel!.teachers![0];
        String chemistryValue=TimetableCubit.get(context).teacherChemistrySubjectModel!.teachers![0];
        String artValue=TimetableCubit.get(context).teacherArtSubjectModel!.teachers![0];
        String musicValue=TimetableCubit.get(context).teacherMusicSubjectModel!.teachers![0];
        String sportsValue=TimetableCubit.get(context).teacherSportsSubjectModel!.teachers![0];
        String socialValue=TimetableCubit.get(context).teacherSocialSubjectModel!.teachers![0];
        String cultureValue=TimetableCubit.get(context).teacherCultureSubjectModel!.teachers![0];
        String religionValue=TimetableCubit.get(context).teacherReligionSubjectModel!.teachers![0];
        String philosophyValue=TimetableCubit.get(context).teacherPhilosophySubjectModel!.teachers![0];
        String scienceValue=TimetableCubit.get(context).teacherScienceSubjectModel!.teachers![0];
        String technologyValue=TimetableCubit.get(context).teacherTechnologySubjectModel!.teachers![0];
            return Card(
                  child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 15,end: 15,),
                        child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                    SizedBox(height: 30,),
                                    Row(
                                      children: [
                                        Row(children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(start: 30,end:30,),
                                            child: buildDropdown(label: 'Sections',
                                                list: TimetableCubit.get(context).showSection!.sectionNumbers!,
                                                onChanged: (value){
                                                  TimetableCubit.get(context).changeSection(value!);
                                                  sectionValue = TimetableCubit.get(context).sectionValue;
                                                },
                                                maxLength:  TimetableCubit.get(context).showSection!.sectionNumbers!.length,
                                                value: sectionValue!
                                            ),
                                          ),
                                        ]    ,
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(start: 200),
                                          child: Text('Time table',
                                                style: TextStyle(
                                                    color:AppColors.lightOrange,
                                                    fontSize: 50,
                                                    fontWeight: FontWeight.bold
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Form(
                                          key: formKey,
                                          child: Column(
                                                children: [
                                                      Column(
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
                                                      SizedBox(height: 50,),
                                                      Padding(
                                                            padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                                                            child: Row(
                                                                  children: [
                                                                        buildDropdown(label: 'Arabic Teacher',
                                                                            list: TimetableCubit.get(context).teacherSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeArabicTeacher(value!);
                                                                                  arabicValue = TimetableCubit.get(context).arabicValue!;
                                                                                  TimetableCubit.get(context).showSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: arabicValue
                                                                        ),

                                                                       buildDropdown(label: 'English Teacher',
                                                                            list: TimetableCubit.get(context).teacherEnglishSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeEnglishTeacher(value!);
                                                                                  englishValue = TimetableCubit.get(context).englishValue!;
                                                                                  TimetableCubit.get(context).showEnglishSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: englishValue
                                                                        ),
                                                                       buildDropdown(label: 'French Teacher',
                                                                            list: TimetableCubit.get(context).teacherFrenchSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeFrenchTeacher(value!);
                                                                                  frenchValue = TimetableCubit.get(context).frenchValue!;
                                                                                  TimetableCubit.get(context).showFrenchSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: frenchValue
                                                                        ),
                                                                        buildDropdown(label: 'Math Teacher',
                                                                            list: TimetableCubit.get(context).teacherMathSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeMathTeacher(value!);
                                                                                  mathValue = TimetableCubit.get(context).mathValue!;
                                                                                  TimetableCubit.get(context).showMathSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: mathValue
                                                                        ),

                                                                        buildDropdown(label: 'Physics Teacher',
                                                                            list: TimetableCubit.get(context).teacherPhysicsSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changePhysicsTeacher(value!);
                                                                                  physicsValue = TimetableCubit.get(context).physicsValue!;
                                                                                  TimetableCubit.get(context).showPhysicsSubjectTeacher();
                                                                                  },
                                                                            maxLength: teachers.length,
                                                                            value: physicsValue
                                                                        ),

                                                                  ],
                                                            ),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      Padding(
                                                            padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                                                            child: Row(
                                                                  children: [
                                                                        buildDropdown(label: 'Chemistry Teacher',
                                                                            list: TimetableCubit.get(context).teacherChemistrySubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeChemistryTeacher(value!);
                                                                                  chemistryValue = TimetableCubit.get(context).chemistryValue!;
                                                                                  TimetableCubit.get(context).showChemistrySubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: chemistryValue
                                                                        ),

                                                                        buildDropdown(label: 'Art Teacher',
                                                                            list: TimetableCubit.get(context).teacherArtSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeArtTeacher(value!);
                                                                                  artValue = TimetableCubit.get(context).artValue!;
                                                                                  TimetableCubit.get(context).showArtSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: artValue
                                                                        ),

                                                                        buildDropdown(label: 'Music Teacher',
                                                                            list: TimetableCubit.get(context).teacherMusicSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeMusicTeacher(value!);
                                                                                  musicValue = TimetableCubit.get(context).musicValue!;
                                                                                  TimetableCubit.get(context).showMusicSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: musicValue
                                                                        ),
                                                                        buildDropdown(label: 'Sports Teacher',
                                                                            list: TimetableCubit.get(context).teacherSportsSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeSportsTeacher(value!);
                                                                                  sportsValue = TimetableCubit.get(context).sportsValue!;
                                                                                  TimetableCubit.get(context).showSportsSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: sportsValue
                                                                        ),

                                                                        buildDropdown(label: 'Social Teacher',
                                                                            list: TimetableCubit.get(context).teacherSocialSubjectModel!.teachers!,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeSocialTeacher(value!);
                                                                                  socialValue = TimetableCubit.get(context).socialValue!;
                                                                                  TimetableCubit.get(context).showSocialSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: socialValue,
                                                                            labelColor: AppColors.lightOrange
                                                                        ),
                                                                  ],
                                                            ),

                                                      ),
                                                      Padding(
                                                            padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                                                            child: Row(
                                                                  children: [
                                                                        buildDropdown(label: 'Culture Teacher',
                                                                            list: TimetableCubit.get(context).teacherCultureSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeCultureTeacher(value!);
                                                                                  cultureValue = TimetableCubit.get(context).cultureValue!;
                                                                                  TimetableCubit.get(context).showCultureSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: cultureValue
                                                                        ),
                                                                        buildDropdown(label: 'Religion Teacher',
                                                                            list: TimetableCubit.get(context).teacherReligionSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeReligionTeacher(value!);
                                                                                  religionValue = TimetableCubit.get(context).religionValue!;
                                                                                  TimetableCubit.get(context).showReligionSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: religionValue
                                                                        ),
                                                                        buildDropdown(label: 'Philosophy Teacher',
                                                                            list: TimetableCubit.get(context).teacherPhilosophySubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changePhilosophyTeacher(value!);
                                                                                  philosophyValue = TimetableCubit.get(context).philosophyValue!;
                                                                                  TimetableCubit.get(context).showPhilosophySubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: philosophyValue
                                                                        ),
                                                                        buildDropdown(label: 'Science Teacher',
                                                                            list: TimetableCubit.get(context).teacherScienceSubjectModel!.teachers!,
                                                                            labelColor: AppColors.lightOrange,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeScienceTeacher(value!);
                                                                                  scienceValue = TimetableCubit.get(context).scienceValue!;
                                                                                  TimetableCubit.get(context).showScienceSubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: scienceValue
                                                                        ),
                                                                        buildDropdown(label: 'Technology Teacher',
                                                                            labelColor: AppColors.lightOrange,
                                                                            list: TimetableCubit.get(context).teacherTechnologySubjectModel!.teachers!,
                                                                            onChanged: (value){
                                                                                  TimetableCubit.get(context).changeTechnologyTeacher(value!);
                                                                                  technologyValue = TimetableCubit.get(context).technologyValue!;
                                                                                  TimetableCubit.get(context).showTechnologySubjectTeacher();
                                                                            },
                                                                            maxLength: teachers.length,
                                                                            value: technologyValue
                                                                        ),

                                                                  ],
                                                            ),
                                                      ),
                                                      SizedBox(height: 50,),
                                                      ConditionalBuilder(
                                                        condition: state is ! AppAddTimetableLoadingState,
                                                        builder:(context)=> defaultTextButton(
                                                            text: 'Submit',
                                                            function: ()
                                                            {
                                                                  if(formKey.currentState!.validate()){
                                                                        AddTimeTable model=AddTimeTable(
                                                                            grade:classValue,
                                                                            section: int.parse(sectionValue!),
                                                                            sundayLessons: [
                                                                                  sunFirstController.text,
                                                                                  sunSecondController.text,
                                                                                  sunThirdController.text,
                                                                                  sunFourthController.text,
                                                                                  sunFifthController.text,
                                                                                  sunSixthController.text],
                                                                            mondayLessons:[
                                                                                  munFirstController.text,
                                                                                  munSecondController.text,
                                                                                  munThirdController.text,
                                                                                  munFourthController.text,
                                                                                  munFifthController.text,
                                                                                  munSixthController.text],
                                                                            tuesdayLessons:[
                                                                                  tueFirstController.text,
                                                                                  tueSecondController.text,
                                                                                  tueThirdController.text,
                                                                                  tueFourthController.text,
                                                                                  tueFifthController.text,
                                                                                  tueSixthController.text],
                                                                            wednesdayLessons:[
                                                                                  wedFirstController.text,
                                                                                  wedSecondController.text,
                                                                                  wedThirdController.text,
                                                                                  wedFourthController.text,
                                                                                  wedFifthController.text,
                                                                                  wedSixthController.text],
                                                                            thursdayLessons:[
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
                                                                        TimetableCubit.get(context).postTimetable(data: model);
                                                                        print(model.toJson(model).toString());


                                                                  }
                                                            },
                                                            radius: 30,
                                                            textSize: 20,
                                                            textColor: AppColors.darkBlue,
                                                            fontWeight: FontWeight.bold,
                                                            background: AppColors.lightOrange
                                                        ),
                                                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                                                      ),
                                                      SizedBox(height: 50,),
                                                ],
                                          ),
                                    )
                              ],
                        ),
                  ),

            );
      },
      fallback: (context)=>Center(child: CircularProgressIndicator()),
),
);
},
);
}

}







