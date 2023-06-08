// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/cubit.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/states.dart';
import 'package:web_schoolapp/presentation/classes/event.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

class AddEvent extends StatelessWidget {
  AddEvent({super.key});
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventWebCubit, EventWebStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: text('Add Event', size: 50),
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
                            datePicker(context: context).then((value) {
                              print(DateFormat.yMMMd().format(value!));
                              dateController.text =
                                  DateFormat.yMMMd().format(value);
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
                          onSubmitted: (textt) {
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
                          child: MaterialButton(
                            onPressed: () {},
                            child: text('POST',
                                size: 24,
                                color: Colors.white,
                                weight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: text('Events', size: 50),
                    ),
                    Container(
                      //height: 600,
                      width: 600,
                      child: Image.asset('images/Events-cuate.png'),
                    ),
                    Container(
                      width: 450,
                      height: 500,
                      child: SingleChildScrollView(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => event(
                                EventWebCubit.get(context).events[index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 5,
                                ),
                            itemCount:
                                EventWebCubit.get(context).events.length),
                      ),
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
  }

  Widget event(Event e) => Container(
        height: 200,
        width: 450,
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
                  child: text(e.title, size: 30, weight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColors.lightOrange,
                      size: 30,
                    ))
              ],
            ),
            Spacer(),
            text(
              e.description,
              size: 20,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Spacer(), text('${e.date} at ${e.time}', size: 18)],
              ),
            )
          ],
        ),
      );
}
