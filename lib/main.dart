
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/login_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_admin.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/bloc_observer.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/layouts/layout1.dart';
import 'package:web_schoolapp/presentation/screens/layouts/staff_layout.dart';
import 'package:web_schoolapp/presentation/screens/login_screen.dart';
import 'package:web_schoolapp/presentation/screens/show_staff.dart';

import 'business logic/cubits/staff_profile/cubit.dart';
import 'network/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await CacheHelper.init();
  Widget? widget;
  token= CacheHelper.getData(key: 'token');
  type=CacheHelper.getData(key: 'type');
  print( token);
  print(type);
  //CacheHelper.removeData(key: 'token');
  //CacheHelper.removeData(key: 'type');

  if( token!=null){
      if(type=='owner')
      {
        widget=DashBoard();
      }
      else if(type=='admin')
      {
        widget=DashBoardStaff();
      }
    }
    else{
      widget=LogIn();
    }

  runApp(
      MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp(
      { this.startWidget}
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => AppLoginCubit(),),
        BlocProvider(create:(context) => WebHomeCubit(),),
        BlocProvider(create:(context) => EventWebCubit()..showEvents(),),
        BlocProvider(create:(context) => ShowTimetableCubit()..showTimetable(grade: 'seventh',section: 1),),
        BlocProvider(create:(context) => StudentCubit(),),
        BlocProvider(create:(context) => AppTeacherWebCubit()..showTeachers(),),
        BlocProvider(create:(context) => TimetableCubit()..showSections()..showSubjectTeacher()..showEnglishSubjectTeacher()
          ..showFrenchSubjectTeacher()..showMathSubjectTeacher()..showPhysicsSubjectTeacher()..showChemistrySubjectTeacher()
          ..showArtSubjectTeacher()..showMusicSubjectTeacher()..showSportsSubjectTeacher()..showSocialSubjectTeacher()
          ..showCultureSubjectTeacher()..showReligionSubjectTeacher()..showPhilosophySubjectTeacher()..showScienceSubjectTeacher()
          ..showTechnologySubjectTeacher()
          ,),
        BlocProvider(create:(context) => WebStaffCubit()..showStaff(),),
        BlocProvider(create:(context) => WebSchoolCubit(),),
        BlocProvider(create: (context)=>StaffProfileCubit(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: buildMaterialColor(AppColors.darkBlue)
        ),
        debugShowCheckedModeBanner: false,
        home:startWidget,
      ),
    );
  }
}
