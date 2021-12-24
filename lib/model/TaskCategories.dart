import 'package:flutter/material.dart';
import 'package:flutter_task_management_ui/utils/Utility.dart';

class TaskCategories {
  final IconData? icon;
  final String? title;
  final String? noOfTaskLeft;
  final String? noOfTaskCompleted;
  final Color? iconColor;
  final Color? bgColor;
  final Color? btnColor;
  final List<Map<String, dynamic>> desc;

  TaskCategories(
    this.icon,
    this.title,
    this.noOfTaskLeft,
    this.noOfTaskCompleted,
    this.iconColor,
    this.bgColor,
    this.btnColor,
    this.desc,
  );
}

List<TaskCategories> taskCategories = [
  TaskCategories(Icons.person_rounded, "Personal", "3", "1", kYellowDark,
      kYellowLight, kYellow, [
    {
      'title': 'Go for walk with dog',
      'time': '9:00 AM',
      'slotTime': '9:00 Am - 10:00 AM',
      'tlColor': kRedDark,
      'bgColor': kRedLight,
    },
    {
      'title': 'Shot on Dribble',
      'time': '10:00 AM',
      'slotTime': '10:00 AM - 12:00 AM',
      'tlColor': kBlueDark,
      'bgColor': kBlueLight,
    },
    {
      'title': '',
      'time': '11:00 AM',
      'slotTime': '',
      'tlColor': kBlueDark,
    },
    {
      'title': '',
      'time': '12:00 PM',
      'slotTime': '',
      'tlColor': Colors.grey.withOpacity(0.3),
    },
    {
      'title': '',
      'time': '1:00 PM',
      'slotTime': '',
      'tlColor': Colors.grey.withOpacity(0.3),
    },
    {
      'title': 'Call With Client',
      'time': '2:00 PM',
      'slotTime': '2:00 PM - 3:00 PM',
      'tlColor': kYellowDark,
      'bgColor': kYellowLight,
    },
    {
      'title': '',
      'time': '3:00 PM',
      'slotTime': '',
      'tlColor': Colors.grey.withOpacity(0.3),
    },
  ]),
  TaskCategories(
      Icons.cases_rounded, "Work", "2", "8", kRedDark, kRedLight, kRed, []),
  TaskCategories(Icons.favorite_rounded, "Health", "1", "1", kBlueDark,
      kBlueLight, kBlue, []),
];
