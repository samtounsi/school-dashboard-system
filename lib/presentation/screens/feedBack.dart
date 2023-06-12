// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Container(
            width: 430,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
            ),
            child: Center(
              child: Text('School Feedback',style: TextStyle(
              color: AppColors.lightOrange,
              fontSize: 45,
              fontWeight: FontWeight.bold
      ),),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                     left: 50, right: 500,
                      top: 30
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.darkBlue,width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                        child:
                        Text('hi i am nour i want to discuss you about my son I an ghanme nour no Its expermenet nour ghnamr juhnpw nour hi i am nour i want to discuss you about my son I an ghanme nour no Its expermenet nour ghnamr juhnpw nour',
                          style: TextStyle(
                            fontSize: 20,
                           height: 2,
                           color: AppColors.darkBlue
                           // color: Colors.white
                          ),
                        ),
                      ),
                  ));
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 20),
          ),
        ],
      ),
    );
  }
}
