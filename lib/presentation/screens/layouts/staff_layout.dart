// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class DashBoardStaff extends StatelessWidget {
  DashBoardStaff();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebStaffCubit, WebStaffStates>(
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
                    extended: WebStaffCubit.get(context).isExpanded,
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
                        WebStaffCubit.get(context).dashBoardElements,
                    selectedIndex: WebStaffCubit.get(context).currentInd,
                    onDestinationSelected: (ind) {
                      WebStaffCubit.get(context).ChangeScreen(ind);
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
                                  WebStaffCubit.get(context).ShowHideRail();
                                },
                                icon: Icon(WebStaffCubit.get(context).arrow),
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
            child: WebStaffCubit.get(context)
                .screens[WebStaffCubit.get(context).currentInd],
          ),
        ]),
      ),
    );
  }
}
