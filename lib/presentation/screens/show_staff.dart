
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_schoolapp/business%20logic/cubits/staff_profile/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/cubit_staff.dart';
import 'package:web_schoolapp/business%20logic/cubits/web_cubit/states_staff.dart';
import 'package:web_schoolapp/data/models/show_staff.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/dropdown.dart';
import 'staff_profile.dart';


String active='true';
class ShowStaff extends StatelessWidget {
  const ShowStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebStaffCubit,WebStaffStates>(
      listener: (context,state)
      {
        if(state is AppStaffWebStaffActiveSuccessState)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

              child: Container(
                  height: 50,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(state.activateUserModel.message.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColors.darkBlue,fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
            ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
        if(state is AppStaffWebStaffShowSuccessState)
        {
          var model =WebStaffCubit.get(context).showStaffModel;
          var list=model?.staff;
        }
        else if(state is AppStaffWebStaffShowErrorState)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 500,vertical: 16),

              child: Container(
                  height: 50,
                  constraints: const BoxConstraints(maxWidth: 400),
                  decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(state.error.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
            ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
        }
        else if(state is AppStaffWebChangeActiveState)
        {
          WebStaffCubit.get(context).showStaff(activeValue: active);
          print(active);
        }
      },
      builder: (context,state)
      {
        var model =WebStaffCubit.get(context).showStaffModel;
        List<Staff>? list=model?.staff;
        return ConditionalBuilder(
          condition:state is ! AppStaffWebStaffShowLoadingState&&model!=null,
          builder:(context)
          {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,bottom: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
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
                                      'All School\'s Admins ',
                                      color: AppColors.darkBlue,
                                      size: 40,
                                      weight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                   physics: NeverScrollableScrollPhysics(),
                                    //scrollDirection: Axis.vertical,
                                    itemBuilder: (context,index)=>buildStaffItem(list!,context,index),
                                    separatorBuilder: (context,index)=>SizedBox(height: 30,),
                                    itemCount: model!.staff!.length),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDropdown(
                            label: 'Active Admins',
                            list: ['true','false'],
                            onChanged: (value)
                            {
                              WebStaffCubit.get(context).changeActive(value);
                              active=WebStaffCubit.get(context).activeValue;
                              //print(WebStaffCubit.get(context).changeActive(value));
                            },
                            maxLength: 2,
                            value: active),
                        SizedBox(height: 100,),
                        Padding(
                          padding: const EdgeInsets.only(right:150.0),
                          child: SvgPicture.asset(
                            'images/In the office-cuate.svg',
                            width: 350.0,
                            height: 400.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          fallback: (context)=>Center(child: CircularProgressIndicator())
        );
      },
    );
  }

  Widget buildStaffItem(List<Staff>staff,context,index){
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
                          '${staff[index].fullName} ',
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
                        onPressed: ()
                        {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Are you sure?',
                                style: TextStyle(color: AppColors.darkBlue),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.darkBlue)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    WebStaffCubit.get(context).activeUser(type: 'admin', id: staff[index].id!).
                                    then((value) => Navigator.pop(context)).then((value) =>WebStaffCubit.get(context).showStaff(activeValue:WebStaffCubit.get(context).activeValue ) );

                                  },
                                  child: const Text('OK',
                                      style: TextStyle(
                                          color: AppColors.darkBlue,
                                          fontSize: 18)),
                                ),
                              ],
                            ),
                          );
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