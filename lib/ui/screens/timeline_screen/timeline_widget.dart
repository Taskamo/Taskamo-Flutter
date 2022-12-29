import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/ui/widgets/time_widget/time_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';


class TimelineAppbar extends StatelessWidget {
  const TimelineAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      actions: <Widget>[Container()],
      flexibleSpace: DecorationWidget(
        margin: const EdgeInsets.all(8),
        container: Container(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          decoration: TaskamoDecoration.decoration,
          child: Row(
            children: [
              const DateWidget(),
              const Expanded(child: SizedBox()),
              const TimeWidget(),
              const SizedBox(width: 8),
              Container(
                height: 6,
                width: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: TaskamoColors.white,
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButtonWidget(
                widget: const IconWidget(
                  url: TaskamoIconCategories.menu,
                  height: 24,
                  width: 24,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CalendarController controller;

  @override
  Widget build(BuildContext context) {
    return DecorationWidget(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      container: Container(
        decoration: TaskamoDecoration.decoration,
        child: SfCalendar(
          dataSource: _getDataSource(),
          controller: controller,
          view: CalendarView.timelineDay,
          backgroundColor: Colors.transparent,
          headerHeight: 0,
          viewHeaderHeight: 0,
          cellBorderColor: TaskamoColors.secondaryText.withOpacity(0.15),
          allowedViews: const [
            CalendarView.day,
          ],
          initialDisplayDate: DateTime.now().add(const Duration(hours: 1)),
          initialSelectedDate: null,
          showCurrentTimeIndicator: true,
          todayHighlightColor: Theme.of(context).primaryColor,
          appointmentBuilder: (context, calendarAppointmentDetails) {
            return Container(
              decoration: BoxDecoration(
                color: TaskamoColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Center(
                child: Text(
                  calendarAppointmentDetails.appointments.first.subject
                      .toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
          timeSlotViewSettings: TimeSlotViewSettings(
            timeRulerSize: 32,
            timeInterval: const Duration(hours: 1),
            timeIntervalWidth: 100,
            timeFormat: "hh:mm",
            startHour: 0,
            endHour: 24,
            timeTextStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }

  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 4)),
        endTime: DateTime.now().add(const Duration(hours: 5)),
        subject: 'Meeting',
      ),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
        endTime: DateTime.now().add(const Duration(days: -2, hours: 5)),
        subject: 'Development Meeting   New York, U.S.A',
      ),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
        endTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
        subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
      ),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
        endTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
        subject: 'Support - Web Meeting   Dubai, UAE',
      ),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: -2, hours: 1)),
        endTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
        subject: 'Project Release Meeting   Istanbul, Turkey',
      ),
    );
    appointments.add(
      Appointment(
          startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
          endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
          subject: 'Release Meeting',
          color: Colors.lightBlueAccent,
          isAllDay: true),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
        endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
        subject: 'Performance check',
        color: Colors.amber,
      ),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
        endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
        subject: 'Customer Meeting   Tokyo, Japan',
      ),
    );
    appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
        endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
        subject: 'Retrospective',
      ),
    );

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
