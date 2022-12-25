import 'package:flutter/material.dart';

class Date {
  String monthName() {
    DateTime now = DateTime.now();

    int monthNo = now.month;
    late String month;

    if (monthNo == 1) {
      month = 'Jan';
    } else if (monthNo == 2) {
      month = 'Feb';
    } else if (monthNo == 3) {
      month = 'Mar';
    } else if (monthNo == 4) {
      month = 'Apr';
    } else if (monthNo == 5) {
      month = 'May';
    } else if (monthNo == 6) {
      month = 'June';
    } else if (monthNo == 7) {
      month = 'July';
    } else if (monthNo == 8) {
      month = 'Aug';
    } else if (monthNo == 9) {
      month = 'Sept';
    } else if (monthNo == 10) {
      month = 'Oct';
    } else if (monthNo == 11) {
      month = 'Nov';
    } else if (monthNo == 12) {
      month = 'Dec';
    }
    return month;
  }

  int dayName() {
    DateTime now = DateTime.now();
    return now.day;
  }

  String weekDayName() {
    DateTime now = DateTime.now();
    int dayN = now.weekday;
    late String dayName;

    if (dayN == 1) {
      dayName = 'Monday';
    } else if (dayN == 2) {
      dayName = 'Tuesday';
    } else if (dayN == 3) {
      dayName = 'Wednesday';
    } else if (dayN == 4) {
      dayName = 'Thursday';
    } else if (dayN == 5) {
      dayName = 'Friday';
    } else if (dayN == 6) {
      dayName = 'Saturday';
    } else if (dayN == 7) {
      dayName = 'Sunday';
    }
    return dayName;
  }
}
