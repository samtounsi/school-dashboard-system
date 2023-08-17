// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/network/cache_helper.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/login_screen.dart';

import '../../components and constants/components.dart';

class DashBoardStaff extends StatelessWidget {
  DashBoardStaff();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebStaffCubit, WebStaffStates>(
      listener: (context, state) {
        if (state is StaffLogoutSuccessState) {
          CacheHelper.removeData(key: 'token').then((value) {
            CacheHelper.removeData(key: 'type').then((value) {
              navigateAndFinish(context, LogIn());
            });
          }).then((value) {
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
                          state.logoutModel.message.toString(),
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
            //homeDataStaff = null;
          });
        } else if (state is StaffLogoutErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 500, vertical: 16),
                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        state.error.toString(),
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
                  LayoutBuilder(
                  builder: (context, constraint)
                    => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: NavigationRail(
                            trailing: ConditionalBuilder(
                              condition: WebStaffCubit.get(context).isExpanded,
                              builder: (context) => ConditionalBuilder(
                                condition: state is! StaffLogoutLoadingState,
                                builder: (context) => MaterialButton(
                                  onPressed: () {
                                    WebStaffCubit.get(context)
                                        .Logout(token: token.toString());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      text('LOGOUT', size: 22, color: Colors.white),
                                    ],
                                  ),
                                ),
                                fallback: (context) => CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              fallback: (context) => SizedBox(height: 15),
                            ),
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
                            destinations: WebStaffCubit.get(context).dashBoardElements,
                            selectedIndex: WebStaffCubit.get(context).currentInd,
                            onDestinationSelected: (ind) {
                              WebStaffCubit.get(context).ChangeScreen(ind);
                            },
                          ),
                        ),
                      ),
                    ),
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
