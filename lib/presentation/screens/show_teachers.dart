// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/teacher_display.dart';
import 'package:web_schoolapp/presentation/screens/teacher_profile.dart';

import '../components and constants/components.dart';

TextEditingController nameController = TextEditingController();

class TeachersDisplay extends StatelessWidget {
  const TeachersDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 50.0,end: 100),
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
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 50,end:30),
                  child: Container(
                    width: 250,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText:'Search by Name',
                        filled: true,
                        fillColor: Colors.white70,
                        labelStyle: TextStyle(color: AppColors.darkBlue),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.darkBlue)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 100),
                  child: IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.search,color: AppColors.darkBlue,)),
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:4,
                    crossAxisSpacing: 35,
                    mainAxisSpacing:35,
                  ),
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: (
                            ){
                              navigateTo(context, TeacherProfile());
                        },
                        child:TeacherShow()
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
