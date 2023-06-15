// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';
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
  TextEditingController gradeController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController sectionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, DashBoardState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                          width: 250,
                          child: TextField(
                            controller: gradeController,
                            decoration: InputDecoration(
                              labelText: 'Search by Grade',
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
                      Row(
                        children: [
                          Text(
                            'state',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          SizedBox(
                            width: 6,
                          ),
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
                        padding: const EdgeInsets.only(right: 30),
                        child: IconButton(
                            onPressed: () {
                              StudentCubit.get(context).runFilter(
                                gradeController.text,
                                sectionController.text,
                                nameController.text,
                              );
                            },
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
                Expanded(
                  child: StudentCubit.get(context).foundUsers.isNotEmpty
                      ? GridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 35,
                          crossAxisSpacing: 35,
                          children: List.generate(
                              StudentCubit.get(context).foundUsers.length,
                              (index) => InkWell(
                                    onTap: () {
                                      navigateTo(context, StudentProfile());
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
                                                  backgroundImage: AssetImage(
                                                    'images/profile.png',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text(
                                                  '${StudentCubit.get(context).foundUsers[index]['name']}',
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
                        )
                      : Center(
                          child: Text(
                          'No results found',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: AppColors.aqua),
                        )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
