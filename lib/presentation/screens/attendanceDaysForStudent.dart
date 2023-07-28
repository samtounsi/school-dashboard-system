import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_profile/student_profile_cubit.dart';
import '../../business logic/cubits/student_profile/student_profile_state.dart';
import '../../data/models/delete_attendance_model.dart';
import '../../data/models/student_profile_model.dart';
import '../components and constants/constants.dart';

class AttendanceDaysStudent extends StatelessWidget {
   AttendanceDaysStudent(
      {Key? key, required this.absenceDays, required this.idStudentAttendance})
      : super(key: key);

   List<DateTime> absenceDays;
  final int idStudentAttendance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 50.0, bottom: 20),
            child: Text(
              'Absence Days:',
              style: TextStyle(
                  color: AppColors.lightOrange,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BlocConsumer<StudentProfileCubit, StudentProfileState>(
            listener: (context, state) {
              if (state is DeleteAttendanceSuccessState) {
                absenceDays=state.successDeleteAttendanceModel.absences;

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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "delete absent student success",
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
                  condition: state is! DeleteAttendanceLoadingState,
                  builder: (BuildContext context) {
                    return  Expanded(
                      child:absenceDays.isEmpty?Center(
                        child: Text('no absence days',style:TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBlue
                        ),),
                      ): ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 500, top: 30, bottom: 30),
                              child: Container(
                                width: 50,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColors.darkBlue, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${absenceDays[index].day}/${absenceDays[index].month}/${absenceDays[index].year}",
                                            // "${absenceDays[index]}",
                                            style: TextStyle(
                                                fontSize: 40,
                                                height: 2,
                                                color: AppColors.darkBlue
                                                // color: Colors.white
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                         IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                          title: const Text(
                                                              'Are you sure to delete?'),
                                                          actions: <Widget>[
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  'cancel',
                                                                )),
                                                            TextButton(
                                                              child: const Text(
                                                                  'delete'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                DeleteAttendanceModel
                                                                    deleteA =
                                                                    DeleteAttendanceModel(
                                                                        date:
                                                                            "${absenceDays[index].year}/${absenceDays[index].month}/${absenceDays[index].day}",
                                                                        studentId:
                                                                            idStudentAttendance.toString());
                                                                StudentProfileCubit
                                                                        .get(
                                                                            context)
                                                                    .postDeleteAttendance(
                                                                        deleteA);
                                                              },
                                                            ),
                                                          ],
                                                        ));
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                size: 40,
                                                color: AppColors.lightOrange,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 20,
                        ),
                        itemCount: absenceDays.length,
                      ),
                    );
                  },
                  fallback: (BuildContext context) => Center(
                        child: CircularProgressIndicator(),
                      ));
            },
          ),
        ],
      ),
    );
  }
}
