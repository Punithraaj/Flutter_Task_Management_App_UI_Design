// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_management_ui/model/TaskCategories.dart';
import 'package:flutter_task_management_ui/utils/Utility.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      body: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.close),
            ),
            TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {},
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 16),
                ))
          ]),
          Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "New Task",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Please enter the task name",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400))),
                autofocus: false,
                enabled: true,
                autocorrect: true,
              )),

          ///For Spacing
          SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                ///Container for Icon
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 240, 240, 1)),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.redAccent,
                  ),
                ),

                ///For spacing
                SizedBox(
                  width: 10,
                ),

                ///For Text
                Text(
                  DateFormat('dd MMMM yyyy').format(today),
                  style: TextStyle(
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[700]),
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                ///Container for Icon
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(255, 240, 240, 1)),
                  child: Icon(
                    Icons.alarm,
                    color: Colors.orangeAccent,
                  ),
                ),

                ///For spacing
                SizedBox(
                  width: 10,
                ),

                ///For Text
                Text(
                  DateFormat('hh:mm a').format(today) +
                      " - " +
                      DateFormat('hh:mm a')
                          .format(today.add(Duration(hours: 2))),
                  style: TextStyle(
                      fontSize: 18,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade700),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Add To",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
          Column(children: [
            getTaskCategories(Icons.person_rounded, kYellowDark, "Personal"),
            getTaskCategories(Icons.work_rounded, kRedDark, "Work"),
            getTaskCategories(Icons.favorite_rounded, kBlueDark, "Health"),
          ])
        ],
      ),
    );
  }

  getTaskCategories(IconData icon, Color color, String title) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Row(children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ]));
  }
}
