import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class CalendarRowController extends StatefulWidget {
  const CalendarRowController({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CalendarController controller;

  @override
  State<CalendarRowController> createState() => _CalendarRowControllerState();
}

class _CalendarRowControllerState extends State<CalendarRowController> {
  final List<String> _list = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          DecorationWidget(
            container: ButtonWidget(
              color: Theme.of(context).backgroundColor,
              widget: const IconWidget(
                url: TaskamoIconCategories.arrowLeftSmall,
                height: 16,
                width: 16,
              ),
              onPressed: () {
                setState(
                      () {
                    widget.controller.backward!();
                  },
                );
              },
            ),
          ),
          Expanded(
            child: DecorationWidget(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              container: Container(
                height: 48,
                decoration: TaskamoDecoration.decoration,
                child: Center(
                  child: Text(
                    "${widget.controller.displayDate!.year} | ${_list[widget.controller.displayDate!.month - 1]} | ${widget.controller.displayDate!.day}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ),
          DecorationWidget(
            container: ButtonWidget(
              color: Theme.of(context).backgroundColor,
              widget: const IconWidget(
                url: TaskamoIconCategories.arrowRightSmall,
                height: 16,
                width: 16,
              ),
              onPressed: () {
                setState(
                      () {
                    widget.controller.forward!();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}