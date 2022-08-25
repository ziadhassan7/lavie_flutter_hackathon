import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class NotificationListItem extends StatelessWidget {
  static const int TODAY = 0;
  static const int YEASTERDAY = 1;
  static const int NORMAL_DATE = 2;

  String message;
  String time;

  NotificationListItem({
    Key? key,
    required this.message,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextPoppins(
              message,
              weight: FontWeight.w600,
          ),

          TextPoppins(
            getFormattedTime(time),
            weight: FontWeight.w400,
            size: 12,
          ),
        ],
      ),
    );
  }

  String getFormattedTime (String time) {
    DateTime dateTime = DateTime.parse(time);
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;

    int hour = dateTime.hour;
    int minute = dateTime.minute;


    switch(timeStatus(day, month, year)) {

      case TODAY:
        return "Created today at ${twoDigitFormatter(hour)}:${twoDigitFormatter(minute)}";

      case YEASTERDAY:
        return "Created yesterday at ${twoDigitFormatter(hour)}:${twoDigitFormatter(minute)}";

      case NORMAL_DATE:
        return "Created at $day/$month/$year";

      default:
        return "";
    }

  }

  int timeStatus (int day, int month, int year) {

    if( day == DateTime.now().day
        && month == DateTime.now().month
        && year == DateTime.now().year) {

      return TODAY;

    } if ((day+1) == DateTime.now().day
        && month == DateTime.now().month
        && year == DateTime.now().year) {

      return YEASTERDAY;

    } else {
      return NORMAL_DATE;
    }

  }

  String twoDigitFormatter(int time) {

    if(time < 10) {
      return "0${time.toString()}";
    } else {
      return time.toString();
    }
  }
}
