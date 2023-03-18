import 'package:intl/intl.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

String home = 'Home';
List<String> getMorningTime() {
  return [
    "7:00AM-8:00AM",
    "8:00AM-9:00AM",
    "9:00AM-10:00AM",
    "10:00AM-11:00AM",
    "11:00AM-12:00PM",
  ];
}

List<String> getAfternoonTimings() {
  return [
    "12:00PM-1:00PM",
    "1:00PM-2:00PM",
    "2:00PM-3:00PM",
    "3:00PM-4:00PM",
    "4:00PM-5:00PM",
  ];
}

String getDateInTextFormatWithIndex(int index) {
  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
  var now = DateTime.now().add(Duration(days: index));
  var monthOfCurrentDate = months[now.month + 1];
  return DateFormat.yMMMd().format(now);
}

String GetCustomDate(int index, DateTime dateTime) {
  if (dateTime.day > DateTime.now().day + 2) {
    return DateFormat.yMMMd().format(dateTime);
  } else {
    return DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 2)));
  }
}
