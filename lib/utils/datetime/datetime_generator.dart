import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//format
String dateTimeFormat(DateTime date, {String format = 'dd-MM-yyyy,h:mm a'}) {
  return DateFormat(format).format(date);
}

String dateFormat(DateTime date, {String format = 'dd-MM-yyyy'}) {
  return DateFormat(format).format(date);
}

String timeFormat(DateTime date, {String format = 'h:mm a'}) {
  return DateFormat(format).format(date);
}

String dateFormatText(DateTime date) {
  return DateFormat('d MMMM, yyyy').format(date);
}

String dateFormatNumSlashI(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

String dateFormatNumSlashD(DateTime date) {
  return DateFormat('yyyy/MM/dd').format(date);
}

String dateFormatNumDashI(DateTime date) {
  return DateFormat('dd-MM-yyyy').format(date);
}

String dateFormatNumDashD(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

//datetime short

DateTime now() {
  return DateTime.now();
}

DateTime today() {
  return DateTime(now().year, now().month, now().day);
}

bool isToday(DateTime dateTime) {
  return today() == DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime tomorrow() {
  return DateTime(now().year, now().month, now().day + 1);
}

DateTime dateTomorrow(DateTime date) {
  return DateTime(date.year, date.month, date.day + 1);
}

DateTime yesterday() {
  return DateTime(now().year, now().month, now().day - 1, 0, 0, 0);
}

DateTime dateYesterday(DateTime date) {
  return DateTime(date.year, date.month, date.day - 1, 0, 0, 0);
}

//datetime method

DateTime setDate(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

DateTime setDateTime(DateTime date, TimeOfDay time) {
  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}
