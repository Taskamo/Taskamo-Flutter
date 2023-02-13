import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/blocs/api/todo/todo_bloc.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/blocs/status_dropdown/todo_status_dropdown_cubit.dart';
import 'package:taskamo/data-models/event/events.dart';
import 'package:taskamo/data-models/timeline/timelines.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:taskamo/ui/widgets/get_days_of_the_week_widget/get_days_of_the_week.dart';
import 'package:taskamo/ui/widgets/popup_menu_widget/popup_menu_widget.dart';
import 'package:taskamo/ui/widgets/task_widget/task_widget.dart';
import 'package:taskamo/ui/widgets/time_widget/time_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/enums/todo_enums.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class HomeEventWidget extends StatelessWidget {
  const HomeEventWidget({
    required this.event,
    Key? key,
  }) : super(key: key);
  final EventModel event;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TaskamoLocaleCategories.upComingEvent.i18n(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  event.dateAgo ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              event.title ?? "",
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: TaskamoColors.secondaryText,
                  ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTimelineWidget extends StatelessWidget {
  const HomeTimelineWidget({Key? key, required this.timeline})
      : super(key: key);
  final TimelineModel timeline;

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       TaskamoLocaleCategories.nextWork.i18n(),
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     ),
            //     const TimelinePopupMenuWidget(),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                timeline.title,
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      color: TaskamoColors.blue,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                timeline.description,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: TaskamoColors.secondaryText,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '${TaskamoLocaleCategories.startsAt.i18n()}  ',
                  ),
                  TextSpan(
                    text: "${timeline.startAt.hour}:${timeline.startAt.minute}",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: TaskamoColors.blue,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCalendarWidget extends StatelessWidget {
  const HomeCalendarWidget({Key? key}) : super(key: key);

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
            const MonthWidget(),
            const SizedBox(height: 24),
            const GetDaysOfTheWeekWidget(),
            SfCalendar(
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

class HomeTaskWidget extends StatelessWidget {
  const HomeTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoStatusDropdownCubit()
        ..changeStatus(
          status: TodoStatus.doing,
        ),
      child: BlocBuilder<TodoStatusDropdownCubit, TodoStatusDropdownState>(
        builder: (context, state) {
          return BlocBuilder<TodoBloc, TodoState>(
            builder: (context, todos) {
              return DecorationWidget(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Container(
                  decoration: TaskamoDecoration.decoration,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      //dropdown todo.enum typed
                      Row(
                        children: const [
                          Expanded(child: TodoStatusDropDown()),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                      if (state is TodoStatusDropdownResult &&
                          todos is TodosState)
                        ..._getTasks(
                          todos: todos,
                          status: state.status,
                        ),
                      InvisibleTextButtonWidget(
                        text: TaskamoLocaleCategories.seeAllTodo.i18n(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(color: TaskamoColors.blue),
                        onPressed: () {
                          context
                              .read<TaskamoRouterBloc>()
                              .add(TodoScreenEvent());
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> _getTasks({
    required TodoStatus status,
    required TodosState todos,
  }) {
    List<Widget> result = [];
    if (status == TodoStatus.todo) {
      for (var element in todos.todos) {
        result.add(
          TodoTodoItem(
            todo: element,
          ),
        );
      }
    } else if (status == TodoStatus.doing) {
      for (var element in todos.doings) {
        result.add(
          DoingTodoItem(
            todo: element,
          ),
        );
      }
    } else {
      for (var element in todos.dons) {
        result.add(
          DoneTodoItem(
            todo: element,
          ),
        );
      }
    }
    return result;
  }
}
