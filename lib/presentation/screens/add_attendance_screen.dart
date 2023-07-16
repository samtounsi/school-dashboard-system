// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, sort_child_properties_last

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/data/models/add_attendance_student_model.dart';
import 'package:web_schoolapp/data/models/student_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../business logic/cubits/student_cubit/cubit.dart';
import '../../business logic/cubits/student_cubit/states.dart';
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
  TextEditingController gradeController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController dateAttendanceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    StudentCubit.get(context)
        .searchStudent(SearchStudentParameters(isActive: true));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.aqua,
          title: Text('Set Attendance for the Day'),
        ),
        floatingActionButton: BlocConsumer<StudentCubit, DashBoardState>(
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
                              color: AppColors.lightOrange,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                             "added absent students success",
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
            return ConditionalBuilder(
              condition: state is! AttendanceStudentLoadingState,
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
                  backgroundColor: AppColors.aqua,
                );
              },
              fallback: (BuildContext context) => CircularProgressIndicator(),
            );
          },
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
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          controller: dateAttendanceController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Choose Date ",
                              labelStyle: TextStyle(
                                color: Color(0xFFA6CDCA),
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
                    defaultformfeild(
                        Width: 150,
                        controller: gradeController,
                        type: TextInputType.text,
                        label: 'grade',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        }),
                    defaultformfeild(
                        Width: 150,
                        controller: sectionController,
                        type: TextInputType.text,
                        label: 'section',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        }),
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
                                StudentCubit.get(context).activeCheck(value!);
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
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<StudentCubit, DashBoardState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is StudentSearchSuccessfulState)
                      return Expanded(
                          child: ListView.separated(
                              itemCount: state.students.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    '${state.students?[index].firstName} ${state.students?[index].lastName}',
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        StudentCubit.get(context).toggleCheck(
                                            state.students[index].id
                                                .toString());
                                      },
                                      icon: StudentCubit.get(context).isExist(
                                              state.students[index].id
                                                  .toString())
                                          ? Icon(
                                              Icons.check_box,
                                              color: AppColors.aqua,
                                            )
                                          : Icon(
                                              Icons.check_box_outline_blank,
                                              color: AppColors.aqua,
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
                    else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
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
  }

  SearchStudentParameters get searchParameters => SearchStudentParameters(
        isActive: StudentCubit.get(context).isActive,
        grade: gradeController.text,
        section: sectionController.text,
      );

  void _makeSearch() =>
      StudentCubit.get(context).searchStudent(searchParameters);
}
