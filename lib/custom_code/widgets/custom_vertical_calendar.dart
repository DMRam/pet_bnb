// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class CustomVerticalCalendar extends StatefulWidget {
  const CustomVerticalCalendar({
    Key? key,
    this.width,
    this.height,
    required this.updatePageUI,
    required this.disabledStartDate,
    required this.disabledEndDate,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() updatePageUI;
  final List<String>? disabledStartDate;
  final List<String>? disabledEndDate;

  @override
  _CustomVerticalCalendarState createState() => _CustomVerticalCalendarState();
}

class _CustomVerticalCalendarState extends State<CustomVerticalCalendar> {
  DateTime? start;
  DateTime? end;

  bool isInRange(DateTime date) {
    if (start == null) return false;
    if (end == null) return date == start;
    return ((date == start || date.isAfter(start!)) &&
        (date == end || date.isBefore(end!)));
  }

  bool isDisabled(DateTime date) {
    if (widget.disabledStartDate != null && widget.disabledEndDate != null) {
      // Convert string dates to DateTime objects
      List<DateTime> disabledStartDates = widget.disabledStartDate!
          .map((dateString) => DateFormat('yyyy-MM-dd').parse(dateString))
          .toList();
      List<DateTime> disabledEndDates = widget.disabledEndDate!
          .map((dateString) => DateFormat('yyyy-MM-dd').parse(dateString))
          .toList();

      // Check if date is disabled
      for (int i = 0; i < disabledStartDates.length; i++) {
        if (date.isAfter(disabledStartDates[i]) &&
                date.isBefore(disabledEndDates[i]) ||
            date.isAtSameMomentAs(disabledStartDates[i]) ||
            date.isAtSameMomentAs(disabledEndDates[i])) {
          return true;
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return PagedVerticalCalendar(
      addAutomaticKeepAlives: true,
      dayBuilder: (context, date) {
        final selectedColor = isInRange(date)
            ? Color.fromARGB(255, 117, 214, 206)
            : Colors.transparent;

        final disabledColor =
            isDisabled(date) ? Colors.grey : Colors.transparent;

        return Container(
          color: selectedColor != Colors.transparent
              ? selectedColor
              : disabledColor,
          child: Center(
            child: Text(DateFormat('d').format(date)),
          ),
        );
      },
      onDayPressed: (DateTime date) {
        if (!isDisabled(date)) {
          setState(() {
            if (start == null)
              start = date;
            else if (end == null)
              end = date;
            else {
              print('selected range from $start to $end');
              start = null;
              end = null;
            }
          });

          String formattedStartDate =
              start != null ? DateFormat('yyyy-MM-dd').format(start!) : '';
          String formattedEndDate =
              end != null ? DateFormat('yyyy-MM-dd').format(end!) : '';

          FFAppState().startDate = formattedStartDate;
          FFAppState().endDate = formattedEndDate;
          widget.updatePageUI();
        }
      },
    );
  }
}
