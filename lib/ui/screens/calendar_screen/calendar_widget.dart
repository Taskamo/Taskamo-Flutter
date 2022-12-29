import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/get_days_of_the_week_widget/get_days_of_the_week.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class CalendarEventOfMonthWidget extends StatelessWidget {
  const CalendarEventOfMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationWidget(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      container: Container(
        decoration: TaskamoDecoration.decoration,
        padding: const EdgeInsets.all(4),
        child: Column(
          children: _getEvents(),
        ),
      ),
    );
  }

  List<Widget> _getEvents() {
    List<Widget> result = [];
    result.add(EventWidget());
    result.add(EventWidget());
    result.add(EventWidget());
    return result;
  }
}

class EventWidget extends StatelessWidget {
  EventWidget({Key? key}) : super(key: key);
  final List<String> months = [
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
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TaskamoColors.white.withOpacity(0.1)),
                child: Center(
                  child: Text(
                    "11",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  months[DateTime.now().month - 1],
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Text(
                "4 days left",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: TaskamoColors.secondaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Amin's Birthday",
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TaskamoColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CalendarController controller;

  @override
  Widget build(BuildContext context) {
    return DecorationWidget(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      container: Container(
        decoration: TaskamoDecoration.decoration,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const GetDaysOfTheWeekWidget(),
            SfCalendar(
              controller: controller,
              view: CalendarView.month,
              backgroundColor: Colors.transparent,
              headerHeight: 0,
              viewHeaderHeight: 0,
              cellBorderColor: Colors.transparent,
              monthViewSettings: MonthViewSettings(
                monthCellStyle: MonthCellStyle(
                  // todayBackgroundColor: TaskamoColors.blue.withOpacity(0.15),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  trailingDatesTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.apply(
                            color: TaskamoColors.secondaryText,
                          ),
                  leadingDatesTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.apply(
                            color: TaskamoColors.secondaryText,
                          ),
                ),
              ),
              firstDayOfWeek: 6,
              allowedViews: const [
                CalendarView.day,
              ],
              showCurrentTimeIndicator: true,
              todayHighlightColor:
                  Theme.of(context).primaryColor.withOpacity(0.05),
              todayTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: TaskamoColors.blue,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
