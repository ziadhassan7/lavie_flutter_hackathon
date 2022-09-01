class TimeHandler {
  static const int THIS_MOMENT = 0;
  static const int MINUTES_AGO = 1;
  static const int TODAY = 2;
  static const int YEASTERDAY = 3;
  static const int NORMAL_DATE = 4;


  static String getFormattedTime (String time) {
    DateTime dateTime = DateTime.parse(time);
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;

    int hour = dateTime.hour;
    int minute = dateTime.minute;


    switch(timeStatus(day, month, year, hour, minute)) {

      case THIS_MOMENT:
        return "This moment";

      case MINUTES_AGO:
        return "${DateTime.now().minute - minute} minutes ago";

      case TODAY:
        return "Today at ${twoDigitFormatter(hour)}:${twoDigitFormatter(minute)}";

      case YEASTERDAY:
        return "Yesterday at ${twoDigitFormatter(hour)}:${twoDigitFormatter(minute)}";

      case NORMAL_DATE:
        return "Since $day/$month/$year";

      default:
        return "";
    }

  }

  static int timeStatus (int day, int month, int year, int hour, int minute) {

    if( day == DateTime.now().day
        && month == DateTime.now().month
        && year == DateTime.now().year) {

      if (minute == DateTime.now().minute) {
        return THIS_MOMENT;

      } if(hour == DateTime.now().hour) {
        return MINUTES_AGO;

      }

      return TODAY;

    } if ((day+1) == DateTime.now().day
        && month == DateTime.now().month
        && year == DateTime.now().year) {

      return YEASTERDAY;

    } else {
      return NORMAL_DATE;
    }

  }

  static String twoDigitFormatter(int time) {

    if(time < 10) {
      return "0${time.toString()}";
    } else {
      return time.toString();
    }
  }
}