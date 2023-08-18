// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, avoid_print, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/states.dart';
import 'package:web_schoolapp/data/models/add_event_model.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

import '../../data/models/event_model.dart';

class AddEvent extends StatelessWidget {
  AddEvent({super.key});
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventWebCubit, EventWebStates>(
      listener: (context, state)
      {
        if(state is ShowEventWebSuccessState)
        {
          model=state.eventModel.events!;
        }
        if(state is AddEventWebSuccessState)
        {
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 550,vertical: 16),

                child: Container(
                    height: 50,
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(color: AppColors.lightOrange,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(state.addEventResponseModel.message.toString(),
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
        }
        else if(state is AddEventWebErrorState)
        {
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
        }

      },
      builder: (context, state)
      {
        if(state is ShowEventWebSuccessState)
        {
          model=state.eventModel.events!;
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: text('Add Event', size: 50,color: AppColors.lightOrange),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 40),
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              controller: dateController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 34, 97, 185),
                                        width: 2),
                                  ),
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: const Color.fromARGB(255, 34, 97, 185),
                                    size: 40,
                                  ),
                                  //icon of text field
                                  labelText: "Event Date",
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: AppColors
                                          .darkBlue) //label text of field
                              ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050))
                                    .then((value) {
                                  print(DateFormat.yMMMd()
                                      .format(value!));
                                  DateFormat('yyyy/MM/dd').format(value);
                                  dateController.text=DateFormat('yyyy/MM/dd').format(value);
                                });
                              },
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 40),
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              controller: timeController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 34, 97, 185),
                                        width: 2),
                                  ),
                                  icon: Icon(
                                    Icons.access_time,
                                    color: const Color.fromARGB(255, 34, 97, 185),
                                    size: 40,
                                  ),
                                  //icon of text field
                                  labelText: "Event Time",
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: AppColors
                                          .darkBlue) //label text of field
                              ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                    .then((value) {
                                  print(
                                      '${value!.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}');
                                  timeController.text =
                                  '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
                                });
                              },
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 90),
                            width: 490,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              controller: titleController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 34, 97, 185),
                                        width: 2),
                                  ),
                                  labelText: "Title",
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: AppColors
                                          .darkBlue) //label text of field
                              ),
                              readOnly: false,
                              onSubmitted: (text) {
                                print(titleController.text);
                              },
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 90),
                            width: 490,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: TextField(
                              maxLines: null,
                              minLines: null,
                              expands: true,
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 34, 97, 185),
                                        width: 2),
                                  ),
                                  alignLabelWithHint: true,
                                  labelText: 'Description',
                                  labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: AppColors
                                          .darkBlue) //label text of field
                              ),
                              readOnly: false,
                              onEditingComplete: () {
                                print(titleController.text);
                              },
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 90,
                            ),
                             Container(
                                width: 400,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.lightOrange,
                                ),
                                child: ConditionalBuilder(
                                  condition: state is ! AddEventWebLoadingState,
                                  builder:(context)=> MaterialButton(
                                    onPressed: ()
                                    {
                                      AddEventModel model=AddEventModel
                                        (
                                          title: titleController.text,
                                          description: descriptionController.text,
                                          eventDate: dateController.text,
                                          eventTime: timeController.text,
                                          userId: '1'
                                      );
                                      EventWebCubit.get(context).postEvent(data: model,body: descriptionController.text,title: titleController.text)
                                          .then((value) => EventWebCubit.get(context).showEvents());
                                      print(model.toJson(model).toString());
                                    },
                                    child: text('POST',
                                        size: 24,
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                  ),
                                  fallback: (context)=>Center(child: CircularProgressIndicator()
                                  ),
                              ),)
                          ],
                        ),]),
                    Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: text('Events', size: 50,color: AppColors.lightOrange),
                        ),
                        Container(
                          //height: 600,
                          width: 600,
                          child: Image.asset('images/Events-cuate.png'),
                        ),
                        ConditionalBuilder(
                          condition: state is ! ShowEventWebLoadingState&&model!=null&&state is ! DeleteEventWebLoadingState,
                          builder: (context)
                          {
                            if(state is ShowEventWebSuccessState)
                            {
                              model=state.eventModel.events!;
                            }
                            return Container(
                              width: 450,
                              height: 500,
                              child: SingleChildScrollView(
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => event(
                                       model[index],context),
                                    separatorBuilder: (context, index) => SizedBox(
                                      height: 5,
                                    ),
                                    itemCount:
                                    model.length),
                              ),
                            );
                          },
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget event(Events e,context) => Container(
        height: 250,
        width: 600,
        decoration: BoxDecoration(
          color: AppColors.backgroundcolor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: text(e.title!, size: 30, weight: FontWeight.bold,color: AppColors.lightOrange),
                ),
                Spacer(),
                IconButton(
                    onPressed: ()
                    {
                      EventWebCubit.get(context).deleteEvent(id:e.id)
                          ?.then((value) =>EventWebCubit.get(context).showEvents() );
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColors.lightOrange,
                      size: 30,
                    ))
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: text(
                e.description!,
                color: AppColors.darkBlue,
                size: 15,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Spacer(), text('${
                    "${DateTime.parse(e.eventDate!).year}/${DateTime.parse(e.eventDate!).month.toString().padLeft(2, '0')}/${DateTime.parse(e.eventDate!).day.toString().padLeft(2, '0')}"

                } at ${e.eventTime!}',
                    color: AppColors.aqua,
                    weight: FontWeight.w600,
                    size: 18)],
              ),
            )
          ],
        ),
      );
}
