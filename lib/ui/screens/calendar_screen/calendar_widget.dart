import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/blocs/api/event/event_bloc.dart';
import 'package:taskamo/data-models/event/events.dart';
import 'package:taskamo/ui/screens/create_screen/event.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/get_days_of_the_week_widget/get_days_of_the_week.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class CalendarEventOfMonthWidget extends StatelessWidget {
  const CalendarEventOfMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is! EventsState) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (state.eventsModel.data.isEmpty) {
            return const SizedBox();
          }
          return DecorationWidget(
            margin: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: TaskamoDecoration.decoration,
              child: Column(
                children: _getEvents(
                  state.eventsModel,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  List<Widget> _getEvents(EventsModel eventsModel) {
    List<Widget> result = [];
    for (var element in eventsModel.data) {
      result.add(EventWidget(element));
    }
    return result;
  }
}

class EventWidget extends StatelessWidget {
  const EventWidget(
    this.event, {
    Key? key,
  }) : super(key: key);
  final EventModel event;

  // final List<String> months = [
  //   "January",
  //   "February",
  //   "March",
  //   "April",
  //   "May",
  //   "June",
  //   "July",
  //   "August",
  //   "September",
  //   "October",
  //   "November",
  //   "December",
  // ];

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
                    "${event.day}",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "${event.month}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Text(
                "${event.dateAgo}",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TaskamoColors.secondaryText,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "${event.title}",
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: TaskamoColors.secondaryText,
                ),
          ),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: TextButtonWidget(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.transparent,
                  overlay: Colors.transparent,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.delete.i18n(),
                  onPressed: () {
                    context.read<EventBloc>().add(
                          DeleteEventEvent(
                            id: event.id!,
                          ),
                        );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButtonWidget(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: TaskamoColors.blue.withOpacity(0.1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.edit.i18n(),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UpdateEvent(
                          eventModel: event,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
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
      child: Container(
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
