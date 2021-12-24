// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_management_ui/model/TaskCategories.dart';
import 'package:flutter_task_management_ui/screens/details/TaskDetailsScreen.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: (taskCategories.length + 1),
          itemBuilder: (context, index) => index > taskCategories.length - 1
              ? _buildLastTask()
              : _buildTask(context, taskCategories[index])),
    );
  }

  _buildLastTask() {
    return DottedBorder(
      color: Colors.grey.shade400,
      borderType: BorderType.RRect,
      radius: Radius.circular(30),
      dashPattern: [8, 8],
      strokeWidth: 2,
      child: Center(
        child: Text(
          "+ Add",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildTask(BuildContext context, TaskCategories taskCategory) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                TaskDetailsScreen(taskCategory: taskCategory)));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: taskCategory.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              taskCategory.icon,
              color: taskCategory.iconColor,
              size: 35,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              taskCategory.title.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTaskStatus(taskCategory.btnColor!,
                    taskCategory.iconColor!, taskCategory.noOfTaskLeft!),
                SizedBox(
                  width: 10,
                ),
                _buildTaskStatus(Colors.white, taskCategory.iconColor!,
                    taskCategory.noOfTaskCompleted!),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildTaskStatus(Color bgColor, Color textColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text + " done",
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
