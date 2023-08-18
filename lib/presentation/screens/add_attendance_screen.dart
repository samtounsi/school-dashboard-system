// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, sort_child_properties_last

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../business logic/cubits/student_cubit/cubit.dart';
import '../../business logic/cubits/student_cubit/states.dart';
import '../../data/models/add_attendance_student_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import '../../data/models/search_student_parameters.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isSelected = true;
  bool isSelectionMode = false;
  Map<int, bool> selectedFlag = {};
  TextEditingController sectionController = TextEditingController();
  TextEditingController dateAttendanceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final grades = [
    'seventh',
    'eighth',
    'ninth',
  ];
  String gradeValue = 'seventh';

  @override
  void initState() {
    // TODO: implement initState
    StudentCubit.get(context)
        .searchStudent(SearchStudentParameters(isActive: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit,DashBoardState>(
      listener: (context, state) {
        if(state is AttendanceStudentSuccessfulState)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 500, vertical: 16),
                  child: Container(
                      height: 50,
                      constraints: const BoxConstraints(maxWidth: 400),
                      decoration: BoxDecoration(
                          color: AppColors.aqua,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                        'added absent students success',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          }
      },
      builder: (context, state) {
        var attendanceModel=StudentCubit.get(context).students;
       if(state is StudentSearchErrorState)
         {
           return Center(child: Text(state.errorMessage,style: TextStyle(
             fontSize: 30,
             color: AppColors.darkBlue
           ),));
         }
         return  Form(
          key: formKey,
          child: Scaffold(
            backgroundColor: Colors.white,

            floatingActionButton:ConditionalBuilder(
              condition: state is ! AttendanceStudentLoadingState,
              builder: (BuildContext context) {
                return FloatingActionButton(
                  onPressed: () {
                    AddAttendanceStudentModel attendance =
                    AddAttendanceStudentModel(
                      date: dateAttendanceController.text,
                      attendance: StudentCubit.get(context).nameAttendance,
                    );
                    StudentCubit.get(context).postListAndDates(attendance);
                  },
                  child: Icon(Icons.add),
                  backgroundColor: AppColors.darkBlue,
                );
              },
              fallback: (BuildContext context) =>CircularProgressIndicator(),

            ),

            body: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.all(5.0),
                width: double.infinity,
                height: double.infinity,
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Set Attendance for the Day',
                          style: TextStyle(color: AppColors.darkBlue,
                              fontSize: 26,
                              fontWeight: FontWeight.w700),),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: TextField(
                              controller: dateAttendanceController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Choose Date ",
                                  labelStyle: TextStyle(
                                      color: AppColors.darkBlue,
                                      fontWeight: FontWeight.w700
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
                                  print(DateFormat('yyyy/MM/dd').format(value!));
                                  dateAttendanceController.text =
                                      DateFormat('yyyy/MM/dd').format(value);
                                });
                              },
                            )),
                      ],
                    ),
                    SizedBox(height: 30,),
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
                                  filled: true,
                                  fillColor: Colors.white70,
                                  labelStyle: TextStyle(  color: AppColors.darkBlue,
                                      fontSize: 20
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
                                  StudentCubit.get(context)
                                      .activeCheck(value!);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:40),
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
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition:state is! StudentSearchLoadingState ,
                      builder: (BuildContext context) {
                        return Expanded(
                            child: ListView.separated(
                                itemCount:attendanceModel!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      '${attendanceModel[index].firstName} ${attendanceModel[index].lastName}',
                                      style: TextStyle(fontSize: 22,
                                          color: AppColors.darkBlue,
                                          // fontWeight: FontWeight.w500),
                                      )  ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          StudentCubit.get(context).toggleCheck(

                                              attendanceModel[index].id.toString()
                                          );

                                        },
                                        icon: StudentCubit.get(context).isExist(
                                            attendanceModel[index].id.toString()
                                        )
                                            ? Icon(
                                          Icons.check_box,
                                          color: AppColors.aqua,
                                        )
                                            : Icon(
                                          Icons.check_box_outline_blank,
                                          color: AppColors.darkBlue,
                                        )),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) => Divider(
                                  height: 10,
                                  thickness: 3,
                                  indent: 20,
                                  endIndent: 10,
                                  color: Color(0xFFC4DAD8),
                                )));

                      },
                      fallback: (BuildContext context)=>Center(child: CircularProgressIndicator(),),

                    ),
                    SizedBox(
                      height: 60,
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

  SearchStudentParameters get searchParameters => SearchStudentParameters(
        isActive: StudentCubit.get(context).isActive,
        grade: gradeValue,
        section: sectionController.text,
      );

  void _makeSearch() =>
      StudentCubit.get(context).searchStudent(searchParameters);
}
