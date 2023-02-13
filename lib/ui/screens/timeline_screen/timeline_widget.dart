import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/blocs/api/timeline/timeline_bloc.dart';
import 'package:taskamo/data-models/timeline/timelines.dart';
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
        child: Container(
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
    return BlocBuilder<TimelineBloc, TimelineState>(
      builder: (context, state) {
        return DecorationWidget(
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Container(
            decoration: TaskamoDecoration.decoration,
            child: SfCalendar(
              allowViewNavigation: false,
              dataSource: _getDataSource(
                list:
                    (state is TimelinesState ? state.timelinesModel.data : []),
              ),
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
              onViewChanged: (viewChangedDetails) {
                context.read<TimelineBloc>().add(
                      GetTimelinesEvent(
                        date:
                            "${viewChangedDetails.visibleDates.first.year}-${viewChangedDetails.visibleDates.first.month}-${viewChangedDetails.visibleDates.first.day}",
                      ),
                    );
              },
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
      },
    );
  }

  _DataSource _getDataSource({required List<TimelineModel> list}) {
    final List<Appointment> appointments = <Appointment>[];
    for (var element in list) {
      appointments.add(
        Appointment(
          startTime: element.startAt,
          endTime: element.endAt,
          subject: element.title,
        ),
      );
    }
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
