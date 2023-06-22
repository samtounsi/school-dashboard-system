
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/staff_profile/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../data/models/staffRegisterModel.dart';
import '../../data/models/staffShowModel.dart';
import 'staff_profile.dart';

List<Staff> staff=[
  Staff(id: 1,firstName: 'Fatima',lastName: 'Alkhlif',),
  Staff(id: 2,firstName: 'Sama',lastName: 'Tunsie',),
  Staff(id: 3,firstName: 'Nour',lastName: 'Ghanem',),
  Staff(id: 4,firstName: 'Abeer',lastName: 'Barakat',),
  Staff(id: 5,firstName: 'Yumna',lastName: 'Hashem',),
];

class ShowStaff extends StatelessWidget {
  const ShowStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0,bottom: 30,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: text(
                      'All School\'s Staff ',
                      color: Colors.grey,
                      size: 40,
                      weight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index)=>buildStaffItem(staff,context,index),
                  separatorBuilder: (context,index)=>SizedBox(height: 30,),
                  itemCount: staff.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStaffItem(List<Staff> staff,context,index){
    return GestureDetector(
      onTap: ()
      {
      StaffProfileCubit.get(context).showStaffProfile(id: '${staff[index].id}').then((value) =>navigateTo(context, StaffProfile(id:'${staff[index].id}')));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 80.0,top: 20,right: 20,),
        child: Row(
          children: [
            Container(
              width:500 ,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top:30,bottom: 30,start: 50,end: 50 ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${staff[index].firstName} ',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightOrange
                          ),
                        ),
                        Text(
                          '${staff[index].lastName}',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightOrange
                          ),
                        ),
                      ],
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