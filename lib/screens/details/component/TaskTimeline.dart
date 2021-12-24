import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeline extends StatelessWidget {
  final Map<String, dynamic> details;
  final bool isLastTimeLine;
  const TaskTimeline(
      {Key? key, required this.details, required this.isLastTimeLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeline(details['tlColor'], isLastTimeLine),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  details['time'],
                ),
                details['title'].isNotEmpty
                    ? _buildCard(details['bgColor'], details['title'],
                        details['slotTime'])
                    : _buildCard(
                        Colors.white, details['title'], details['slotTime'])
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTimeline(Color color, bool isLastTimeLine) {
    return Container(
        height: 80,
        width: 20,
        child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              indicatorXY: 0,
              width: 15,
              indicator: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(width: 5, color: color)),
              ),
            ),
            afterLineStyle: !isLastTimeLine
                ? LineStyle(thickness: 2, color: color)
                : LineStyle(
                    thickness: 0,
                  )));
  }

  _buildCard(Color bgColor, String title, String slotTime) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(slotTime),
        ],
      ),
    );
  }
}
