// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
import 'package:web_schoolapp/data/models/search_student_parameters.dart';
import 'package:web_schoolapp/data/models/student_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/profile_student.dart';

import '../components and constants/components.dart';

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
              BlocConsumer<StudentCubit, DashBoardState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
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
                                  padding: EdgeInsets.only(left: 20, right: 10),
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
                        BlocConsumer<StudentCubit, DashBoardState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Row(
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
                                    StudentCubit.get(context)
                                        .activeCheck(value!);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
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
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<StudentCubit, DashBoardState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is StudentSearchErrorState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }
                  if (state is StudentSearchSuccessfulState) {
                    return state.students.isNotEmpty
                        ? Expanded(
                            child:
                                // studentView!.students!.isNotEmpty
                                GridView.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 35,
                            crossAxisSpacing: 35,
                            children: List.generate(
                                state.students.length,
                                (index) => InkWell(
                                      onTap: () {
                                        navigateTo(
                                            context,
                                            StudentProfile(
                                                studentId:
                                                    state.students[index].id));
                                      },
                                      child: Center(
                                        child: Column(children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.borderColor,
                                            ),
                                            height: 250,
                                            width: 300,
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Spacer(),
                                                  CircleAvatar(
                                                      radius: 60,
                                                      foregroundColor:
                                                          Colors.grey[300],
                                                      backgroundImage: NetworkImage(
                                                          '${state.students[index].photo}'),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Text(
                                                    '${state.students?[index].firstName} ${state.students?[index].lastName}',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: AppColors.aqua,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                    )),
                          ))
                        : Center(
                            child: Text('No Results Found',
                            style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColors.aqua),),
                          );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ));
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
