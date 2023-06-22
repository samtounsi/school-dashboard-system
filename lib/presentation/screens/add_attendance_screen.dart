// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../business logic/cubits/student_cubit/cubit.dart';
import '../../business logic/cubits/student_cubit/states.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<String> s = [
    //يحدد من الباك عدد الشعب لكل صف
    "section 1",
    "section 2",
    "section 3",
    "section 4",
    "section 5",
    "section 6",
    "section 7",
    "section 8",
    "section 9",
    "section 10"
  ];
  bool isSelected = true;
  bool isSelectionMode = false;
  Map<int, bool> selectedFlag = {};
  TextEditingController gradeController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, DashBoardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.aqua,
              title: Text('Set Attendance for the Day'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // post(String grade,String section,List attendance,date){}
                if (formKey.currentState!.validate()) {}
                //if list is Empty message=>There is no absence today
              },
              child: Icon(Icons.add),
              backgroundColor: AppColors.aqua,
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
                              controller: dateOfBirth,
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
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2050))
                                    .then((value) {
                                  print(DateFormat.yMMMd().format(value!));
                                  dateOfBirth.text =
                                      DateFormat.yMMMd().format(value);
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
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ListView.separated(
                        itemCount: s.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              StudentCubit.get(context).section(s[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: AppColors.aqua,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Text(
                                  s[index],
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 20,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context,index)=>SizedBox(width: 15,),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: StudentCubit.get(context)
                                .sectionUser
                                .isNotEmpty
                            ? ListView.separated(
                                itemCount: StudentCubit.get(context)
                                    .sectionUser
                                    .length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        '${StudentCubit.get(context).sectionUser[index]['name']}'),
                                    trailing: IconButton(
                                        onPressed: () {
                                          print(
                                              '${StudentCubit.get(context).nameAttendance}');
                                          StudentCubit.get(context)
                                              .toggleCheck(
                                              StudentCubit.get(context)
                                                          .sectionUser[index]
                                                      ['name']);
                                        },
                                        icon:StudentCubit.get(context)
                                                .isExist(
                                            StudentCubit.get(context)
                                                            .sectionUser[index]
                                                        ['name'])
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
                                    (BuildContext context, int index) =>
                                        Divider(
                                          height: 10,
                                          thickness: 3,
                                          indent: 20,
                                          endIndent: 10,
                                          color: Color(0xFFC4DAD8),
                                        ))
                            : Center(child: const Text('Not Found'))),
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
}
