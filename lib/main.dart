// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/add_attendance_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_admin.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/presentation/screens/layouts/staff_layout.dart';
import 'package:web_schoolapp/presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AppLoginCubit(),),
        BlocProvider(create:(context) => WebHomeCubit(),),
        BlocProvider(create:(context) => AttendanceCubit(),),
        BlocProvider(create:(context) => EventWebCubit(),),
        BlocProvider(create:(context) => ShowTimetableCubit(),),
        BlocProvider(create:(context) => StudentCubit(),),
        BlocProvider(create:(context) => AppTeacherWebCubit(),),
        BlocProvider(create:(context) => TimetableCubit(),),
        BlocProvider(create:(context) => WebStaffCubit(),),
        BlocProvider(create:(context) => WebSchoolCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogIn(),
      ),
    );
  }
}
