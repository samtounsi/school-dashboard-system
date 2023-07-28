// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/teacher_cubit/states.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/screens/teacher_profile.dart';

import '../../business logic/cubits/teacher_cubit/cubit.dart';
import '../../data/models/show_teachers_model.dart';
import '../../data/models/teacher_show_model.dart';
import '../components and constants/components.dart';
import '../components and constants/dropdown.dart';

TextEditingController nameController = TextEditingController();
String activeT='true';

class TeachersDisplay extends StatelessWidget {
  const TeachersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppTeacherWebCubit, AppTeacherWebStates>(
      listener: (context, state)
      {
        if(state is AppShowTeacherSuccessState)
        {
          var model =AppTeacherWebCubit.get(context).showTeachersModel;
          var list=model?.teachers;
        }
        /*else if(state is AppChangeActiveTeacherState)
        {
          AppTeacherWebCubit.get(context).showTeachers(activeValue: activeT);
          print(activeT);
        }*/
      },
      builder: (context, state) {
        var model =AppTeacherWebCubit.get(context).showTeachersModel;
        var list=model?.teachers;
        return ConditionalBuilder(
          condition:state is ! AppShowTeacherLoadingState&&model!=null,
          builder:(context)
          {
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
                        buildDropdown(
                            label: 'Active Teachers',
                            list: ['true','false'],
                            onChanged: (value)
                            {
                              AppTeacherWebCubit.get(context).changeActive(value);
                              activeT=AppTeacherWebCubit.get(context).activeValue;
                              //print(WebStaffCubit.get(context).changeActive(value));
                            },
                            maxLength: 2,
                            value: activeT),
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
                                AppTeacherWebCubit.get(context).showTeachers(activeValue: activeT)
                                    .then((value) =>   AppTeacherWebCubit.get(context)
                                    .runFilter(Teachers(fullName: nameController.text)));
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
                      child: AppTeacherWebCubit.get(context).foundUsers!.isNotEmpty
                          ? GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 35,
                        crossAxisSpacing: 35,
                        children: List.generate(
                            AppTeacherWebCubit.get(context).foundUsers!.length,
                                (index) => InkWell(
                              onTap: () {
                                if(AppTeacherWebCubit.get(context).foundUsers![index].id!=null)
                                {
                                  print(AppTeacherWebCubit.get(context).foundUsers![index].photo);
                                  print( AppTeacherWebCubit.get(context).foundUsers![index].id.toString());
                                   AppTeacherWebCubit.get(context).showTeacherProfile(id: '${AppTeacherWebCubit.get(context).foundUsers![index].id.toString()}')
                                   .then((value) =>
                                  navigateTo(context, TeacherProfile(id:AppTeacherWebCubit.get(context).foundUsers![index].id.toString())));
                                }

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
                                          Container(
                                            height:150 ,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,),
                                            child: CachedNetworkImage(
                                              imageUrl: AppTeacherWebCubit.get(context).foundUsers![index].photo,
                                              imageBuilder: (context, imageProvider) => Container(
                                                height: 120,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ), placeholder: (context, url) => const CircularProgressIndicator(),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${AppTeacherWebCubit.get(context).foundUsers![index].fullName}',
                                            style: TextStyle(
                                                fontSize: 15,
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
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
