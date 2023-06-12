
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import 'layouts/staff_profile.dart';

List<String> staff=['Fatima Alkhlif','Sama Tunsie','Nour Ghanem','Abeer Barakat','Yumna Hashem','Fatima Alkhlif','Sama Tunsie','Nour Ghanem','Abeer Barakat','Yumna Hashem'];

class ShowStaff extends StatelessWidget {
  const ShowStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index)=>buildStaffItem(staff[index],context),
            separatorBuilder: (context,index)=>SizedBox(height: 30,),
            itemCount: 10),
      ),
    );
  }

  Widget buildStaffItem(staff,context){
    return GestureDetector(
      onTap: (){
        navigateTo(context, StaffProfile());
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width:600 ,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
                  borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top:30,bottom: 30,start: 50,end: 50 ),
                child: Row(
                  children: [
                    Text(
                      '$staff',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightOrange
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.borderColor.withAlpha(60),
                          shape: BoxShape.circle,
                        border: Border.all(
                          color:AppColors.lightOrange
                        )
                          ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.delete_forever_outlined,
                          color: AppColors.lightOrange,
                          size: 30,
                        ),
                        onPressed: (){

                        },),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
