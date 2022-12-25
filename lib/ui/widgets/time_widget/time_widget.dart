import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  String _timeString = '';

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(
      () {
        _timeString = formattedDateTime;
      },
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour >= 10 ? dateTime.hour : '0${dateTime.hour}'}:${dateTime.minute >= 10 ? dateTime.minute : '0${dateTime.minute}'}";
  }
}

class DateWidget extends StatefulWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  String _yearString = '';
  String _monthString = '';
  final List _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    _yearString = _formatYearTime(DateTime.now());
    _monthString = _formatMonthTime(DateTime.now());
    Timer.periodic(const Duration(minutes: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _yearString,
          style: Theme.of(context).textTheme.labelSmall!.apply(
            color: TaskamoColors.secondaryText,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          _monthString,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedMonthTime = _formatMonthTime(now);
    final String formattedYearTime = _formatYearTime(now);
    setState(
      () {
        _yearString = formattedYearTime;
        _monthString = formattedMonthTime;
      },
    );
  }

  String _formatYearTime(DateTime dateTime) {
    return "${dateTime.year}";
  }

  String _formatMonthTime(DateTime dateTime) {
    return "${_months[dateTime.month - 1]}  ${dateTime.day}";
  }
}
