// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import '../../data/models/active_success_student_model.dart';
import '../../data/models/search_student_parameters.dart';
import '../../data/models/student_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import '../components and constants/components.dart';
import 'profile_student.dart';


//import 'package:untitled4/dashboardWebProject1/add_student.dart';
//import 'package:untitled4/dashboardWebProject1/itemShow.dart';

class SearchStudent extends StatefulWidget {
  @override
  State<SearchStudent> createState() => _SearchStudentState();
}

class _SearchStudentState extends State<SearchStudent> {
  TextEditingController nameController = TextEditingController();

  TextEditingController sectionController = TextEditingController();
  StudentModel? studentView;
  final grades = [
    'seventh',
    'eighth',
    'ninth',
  ];
  String gradeValue = 'seventh';

  @override
  void initState() {
    StudentCubit.get(context)
        .searchStudent(SearchStudentParameters(isActive: true));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, DashBoardState>(
      listener: (context, state) {},
      builder: (context, state) {
        var sModel = StudentCubit.get(context).students;
        if (state is StudentSearchErrorState) {
          return Center(
              child: Text(
            state.errorMessage,
            style: TextStyle(color: AppColors.darkBlue, fontSize: 30),
          ));
        } else {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Students',
                      style: TextStyle(
                          color: AppColors.aqua,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 50),
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: DropdownButton(
                                value: gradeValue,
                                items: [
                                  //add items in the dropdown
                                  DropdownMenuItem(
                                    child: Text("seventh"),
                                    value: "seventh",
                                  ),
                                  DropdownMenuItem(
                                      child: Text("eighth"), value: "eighth"),
                                  DropdownMenuItem(
                                      child: Text("ninth"), value: "ninth"),
                                ],
                                onChanged: (value) {
                                  StudentCubit.get(context).changeGrade(value!);
                                  gradeValue =
                                      StudentCubit.get(context).dropDown1!;
                                },
                                icon: Padding(
                                    //Icon at tail, arrow bottom is default icon
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColors.darkAqua,
                                    )),
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.darkAqua),
                                dropdownColor: Colors.white,
                                //dropdown background color
                                underline: Container(),
                                //remove underline
                                isExpanded: true, //make true to make width 100%
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 50),
                            child: Container(
                              width: 250,
                              child: TextField(
                                controller: sectionController,
                                decoration: InputDecoration(
                                  labelText: 'Search by Section',
                                  // prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide: BorderSide(
                                          color: AppColors.aqua, width: 2)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 50),
                            child: Container(
                              width: 250,
                              child: TextField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: 'Search by Name',
                                  filled: true,
                                  fillColor: Colors.white70,
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide: BorderSide(
                                          color: AppColors.aqua, width: 2)),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'State',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: AppColors.aqua),
                              ),
                              SizedBox(width: 6),
                              Checkbox(
                                focusColor: AppColors.darkBlue,
                                checkColor: AppColors.darkBlue,
                                activeColor: AppColors.aqua,
                                value: StudentCubit.get(context).isActive,
                                onChanged: (bool? value) {
                                  StudentCubit.get(context).activeCheck(value!);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: IconButton(
                                onPressed: _makeSearch,
                                icon: Icon(
                                  Icons.search,
                                  color: AppColors.aqua,
                                  size: 40,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ConditionalBuilder(
                        condition: state is! StudentSearchLoadingState,
                        builder: (context) {
                          return Expanded(
                              child: sModel!.isNotEmpty
                                  ? GridView.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 29,
                                      crossAxisSpacing: 28,
                                      children: List.generate(
                                          sModel.length,
                                          (index) => InkWell(
                                                onTap: () {
                                                  navigateTo(
                                                      context,
                                                      StudentProfile(
                                                        studentId:
                                                            sModel[index].id,
                                                        activate: sModel[index]
                                                            .isActive,
                                                      ));
                                                },
                                                child: Center(
                                                  child: Column(children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .borderColor,
                                                      ),
                                                      height: 250,
                                                      width: 300,
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            Spacer(),
                                                            Stack(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .bottomEnd,
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 70.0,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius:
                                                                        65.0,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            sModel[index].photo),

                                                                    //    : FileImage(imageFile as File) as ImageProvider,Image.memory(imageFile!)
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 25,
                                                            ),
                                                            Text(
                                                              "${sModel[index].firstName} ${sModel[index].lastName}",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color:
                                                                      Colors.black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Spacer(),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              )),
                                    )
                                  : Center(
                                      child: Text(
                                        'Not Found',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ));
                        },
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            )),
                  ],
                ),
              ));
        }
      },
    );
  }

  SearchStudentParameters get searchParametes => SearchStudentParameters(
        isActive: StudentCubit.get(context).isActive,
        grade: gradeValue,
        name: nameController.text,
        section: sectionController.text,
      );

  void _makeSearch() =>
      StudentCubit.get(context).searchStudent(searchParametes);
}
