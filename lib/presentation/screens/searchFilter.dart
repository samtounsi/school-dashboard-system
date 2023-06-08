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
          appBar: AppBar(
            title: Text('Students'),
            backgroundColor: AppColors.aqua,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 50),
                        child: Container(
                          width: 250,
                          child: TextField(
                            controller: gradeController,
                            decoration: InputDecoration(
                              labelText: 'grade',
                              // prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white70,
                              labelStyle: TextStyle(color: AppColors.aqua),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(color: Colors.grey)),
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
                              labelText: 'section',
                              // prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white70,
                              labelStyle: TextStyle(color: AppColors.aqua),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(color: Colors.grey)),
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
                              labelText: 'name',
                              // prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white70,
                              labelStyle: TextStyle(color: AppColors.aqua),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 200,
                      //   height: 60.0,
                      //   child: TextFormField(
                      //       controller: nameController,
                      //       decoration: InputDecoration(
                      //           labelText: 'Enter name',
                      //           prefixIcon: Icon(Icons.search)),
                      //       onChanged: (value) {}),
                      // ),
                      IconButton(
                          onPressed: () {
                            StudentCubit.get(context).runFilter(
                                gradeController.text,
                                sectionController.text,
                                nameController.text);
                          },
                          icon: Icon(Icons.search))
                    ],
                  ),
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
                                      child: Stack(children: [
                                        Padding(
                                          // key: ValueKey(_foundUsers[index]["id"]),
                                          padding: EdgeInsets.all(30.0),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                AppColors.backgroundcolor,
                                            radius: 150,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 120,
                                          right: 0.0,
                                          left: 0.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 50,
                                                    backgroundColor:
                                                        Colors.grey[300],
                                                    backgroundImage: AssetImage(
                                                        'images/profile.png'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    '${StudentCubit.get(context).foundUsers[index]['name']}',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                              fontSize: 30, fontWeight: FontWeight.w800),
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
