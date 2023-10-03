// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../business logic/cubits/feedback_cubit/cubit.dart';
import '../../business logic/cubits/feedback_cubit/state.dart';



class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();

}

class _FeedBackState extends State<FeedBack> {
  @override
  void initState() {
    FeedbackCubit.get(context).getFeedback();

    super.initState();
  }
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
          BlocConsumer<FeedbackCubit,FeedbackState>(
            listener: (context, state){},
            builder: (context, state) {
              if(state is FeedbackErrorState)
               return Center(child: Text(state.errorFeedback,
               style: TextStyle(fontSize: 20,
               color: AppColors.darkBlue),));
              else if(state is FeedbackSuccessState)
              return  Expanded(
                child:state.feedbacks.isNotEmpty? ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 50, right: 500,
                              top: 30
                          ),
                          child: Container(
                            width: 200,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.darkBlue,width: 2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('${state.feedbacks[index].author}',
                                      style: TextStyle(fontSize: 20,
                                      color: AppColors.lightOrange
                                      )),
                                    ],
                                  ),
                                  Text('${state.feedbacks[index].feedback}',
                                    style: TextStyle(
                                        fontSize: 30,
                                        height: 2,
                                        color: AppColors.darkBlue
                                      // color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: state.feedbacks.length):Center(
                      child: Text('No Feedback',style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue
                ),),
                    ),
              );
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            },

          ),
        ],
      ),
    );
  }
}
