// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/teacher_profile.dart';

import '../../business logic/cubits/teacher_cubit/cubit.dart';
import '../../data/models/teacher_show_model.dart';
import '../components and constants/components.dart';

TextEditingController nameController = TextEditingController();
/*List<Teachers> teachers=[
  Teachers(id: 0,firstName: 'Fatima',lastName: 'Alkhlif',),
  Teachers(id: 1,firstName: 'Sama',lastName: 'Tunsie',),
  Teachers(id: 2,firstName: 'Nour',lastName: 'Ghancem',),
  Teachers(id: 3,firstName: 'Nour',lastName: 'Ghancem',),
];*/
class TeachersDisplay extends StatelessWidget {
  const TeachersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTeacherWebCubit, AppTeacherWebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.only(start: 50.0, end: 100),
                      child: Container(
                        width: 300,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: text(
                              'All Teachers',
                              color: AppColors.darkBlue,
                              size: 40,
                              weight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 50, end: 30),
                      child: Container(
                        width: 250,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Search by Name',
                            filled: true,
                            fillColor: Colors.white70,
                            labelStyle: TextStyle(color: AppColors.darkBlue),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide:
                                BorderSide(color: AppColors.darkBlue)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 100),
                      child: IconButton(
                          onPressed: () {
                            AppTeacherWebCubit.get(context)
                                .runFilter(Teachers(fullName: nameController.text));
                          },
                          icon: Icon(
                            Icons.search,
                            color: AppColors.darkBlue,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: AppTeacherWebCubit.get(context).foundUsers.isNotEmpty
                      ? GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 35,
                    crossAxisSpacing: 35,
                    children: List.generate(
                        AppTeacherWebCubit.get(context).foundUsers.length,
                            (index) => InkWell(
                          onTap: () {
                            print(AppTeacherWebCubit.get(context).foundUsers[index].id);
                           AppTeacherWebCubit.get(context).showTeacherProfile(id: '${AppTeacherWebCubit.get(context).foundUsers[index].id}').then((value) =>navigateTo(context, TeacherProfile(id:'${AppTeacherWebCubit.get(context).foundUsers[index].id}')));

                          },
                          child: Center(
                            child: Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.borderColor,
                                ),
                                height: 250,
                                width: 300,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      CircleAvatar(
                                        radius: 60,
                                        foregroundColor:
                                        Colors.grey[300],
                                        backgroundImage: AssetImage(
                                          'images/profile.png',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        '${AppTeacherWebCubit.get(context).foundUsers[index].fullName}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: AppColors.darkBlue,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        )),
                  )
                      : Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: AppColors.darkBlue),
                      )),
                ),
              ],
            ));
      },
    );
  }
}
