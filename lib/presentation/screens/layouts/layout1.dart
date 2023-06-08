// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_admin.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_admin.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';


class DashBoard extends StatelessWidget {
  DashBoard();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebSchoolCubit, WebSchoolStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Row(children: [
          Material(
            elevation: 7,
            child: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     stops: [
                //   0.3,
                //   1,
                // ],
                //     colors: [
                //   AppColors.aqua,
                //   AppColors.darkBlue,
                //   //Color(0xFFF0B976),
                // ])
                image: DecorationImage(
                  image: AssetImage('images/OnBoard1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  NavigationRail(
                    extended: WebSchoolCubit.get(context).isExpanded,
                    backgroundColor: Colors.white.withOpacity(0),
                    unselectedIconTheme:
                        IconThemeData(color: Colors.white, opacity: 0.9),
                    unselectedLabelTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: webFont,
                    ),
                    selectedIconTheme: IconThemeData(
                        color: Color.fromARGB(255, 21, 41, 68), opacity: 0.9),
                    selectedLabelTextStyle: TextStyle(
                      color: Color.fromARGB(255, 21, 41, 68),
                      fontSize: webFont + 3,
                      fontWeight: FontWeight.bold,
                    ),
                    destinations:
                        WebSchoolCubit.get(context).dashBoardElements,
                    selectedIndex: WebSchoolCubit.get(context).currentInd,
                    onDestinationSelected: (ind) {
                      WebSchoolCubit.get(context).ChangeScreen(ind);
                    },
                  ),
                  Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  WebSchoolCubit.get(context).ShowHideRail();
                                },
                                icon: Icon(WebSchoolCubit.get(context).arrow),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: WebSchoolCubit.get(context)
                .screens[WebSchoolCubit.get(context).currentInd],
          ),
        ]),
      ),
    );
  }
}
