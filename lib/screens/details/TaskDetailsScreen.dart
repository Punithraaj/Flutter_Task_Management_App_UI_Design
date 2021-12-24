// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_management_ui/model/TaskCategories.dart';
import 'package:flutter_task_management_ui/screens/details/component/TaskTimeline.dart';
import 'package:flutter_task_management_ui/screens/details/component/TaskTitle.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskCategories taskCategory;
  const TaskDetailsScreen({Key? key, required this.taskCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskDetailList = taskCategory.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.grey.shade300,
                      selectedTextColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TaskTitle(),
                ],
              ),
            ),
          ),
          (taskDetailList.isEmpty && taskDetailList.length <= 0)
              ? SliverFillRemaining(
                  child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        "No Task Available for Taday",
                        style: TextStyle(color: Colors.black),
                      ))),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (_, index) => TaskTimeline(
                            details: taskDetailList[index],
                            isLastTimeLine: index == taskDetailList.length - 1
                                ? true
                                : false,
                          ),
                      childCount: taskDetailList.length)),
        ],
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 90,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        iconSize: 20,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${taskCategory.title} Task",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "You have ${taskCategory.noOfTaskLeft} new task today",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      actions: [
        Icon(
          Icons.more_vert,
          color: Colors.white,
          size: 30,
        )
      ],
    );
  }
}
