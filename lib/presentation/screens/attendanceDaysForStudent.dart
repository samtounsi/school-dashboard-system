import 'package:flutter/material.dart';

import '../components and constants/constants.dart';

class AttendanceDaysStudent extends StatelessWidget {
  AttendanceDaysStudent({Key? key}) : super(key: key);
  List<String> absenceDays = [
    '12/6/2023',
    '15/1/2024',
    '16/3/2024',
    '12/6/2023',
    '5/1/2024',
    '6/3/2024',
    '2/6/2023',
    '5/1/2024',
    '16/3/2024',
    '12/6/2023',
    '15/1/2024',
    '16/3/2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Absence Days',
          style: TextStyle(color: AppColors.darkBlue, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 500, top: 30, bottom: 60),
              child: Container(
                width: 50,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.darkBlue, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 2,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            absenceDays[index],
                            style: TextStyle(
                                fontSize: 40,
                                height: 2,
                                color: AppColors.darkBlue
                                // color: Colors.white
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                size: 40,
                                color: AppColors.darkBlue,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 20,
        ),
        itemCount: absenceDays.length,
      ),
    );
  }
}
