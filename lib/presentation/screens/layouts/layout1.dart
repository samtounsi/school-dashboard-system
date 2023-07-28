// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_admin.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_admin.dart';
import 'package:web_schoolapp/network/cache_helper.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/login_screen.dart';

class DashBoard extends StatelessWidget {
  DashBoard();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebSchoolCubit, WebSchoolStates>(
      listener: (context, state) {
        if (state is AppLogoutSuccessState) {
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
            //homeData = null;
          });
        } else if (state is AppLogoutErrorState) {
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
        body: Center(
          child: Row(children: <Widget>[
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
                      builder: (context, constraint) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: constraint.maxHeight),
                            child: IntrinsicHeight(
                              child: NavigationRail(
                                trailing: ConditionalBuilder(
                                  condition:
                                      WebSchoolCubit.get(context).isExpanded,
                                  builder: (context) => ConditionalBuilder(
                                    condition: state is! AppLogoutLoadingState,
                                    builder: (context) => MaterialButton(
                                      onPressed: () {
                                        WebSchoolCubit.get(context)
                                            .Logout(token: token.toString());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          text('LOGOUT',
                                              size: 22, color: Colors.white),
                                        ],
                                      ),
                                    ),
                                    fallback: (context) =>
                                        CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  fallback: (context) => SizedBox(height: 15),
                                ),
                                extended:
                                    WebSchoolCubit.get(context).isExpanded,
                                backgroundColor: Colors.white.withOpacity(0),
                                unselectedIconTheme: IconThemeData(
                                    color: Colors.white, opacity: 0.9),
                                unselectedLabelTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: webFont,
                                ),
                                selectedIconTheme: IconThemeData(
                                    color: Color.fromARGB(255, 21, 41, 68),
                                    opacity: 0.9),
                                selectedLabelTextStyle: TextStyle(
                                  color: Color.fromARGB(255, 21, 41, 68),
                                  fontSize: webFont + 3,
                                  fontWeight: FontWeight.bold,
                                ),
                                destinations: WebSchoolCubit.get(context)
                                    .dashBoardElements,
                                selectedIndex:
                                    WebSchoolCubit.get(context).currentInd,
                                onDestinationSelected: (ind) {
                                  WebSchoolCubit.get(context).ChangeScreen(ind);
                                },
                              ),
                            ),
                          ),
                        );
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
      ),
    );
  }
}
