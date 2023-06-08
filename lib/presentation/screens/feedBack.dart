// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 30,right: 30,
                top: 30
              ),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.aqua

                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                  child: Text('hi i am nour i want to discuss you about my son I an ghanme nour no Its expermenet nour ghnamr juhnpw nour ghaosfosa slfjdjfjsdf sdjf;odsg this is required failed random accsee yumna abeer nour baod sama fatima nour sfjsjfojsf sjfsjfsfs faspjfsf',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
            ));
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
          itemCount: 20),
    );
  }
}
