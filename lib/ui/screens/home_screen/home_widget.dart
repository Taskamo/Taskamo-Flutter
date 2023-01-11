import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/blocs/status_dropdown/todo_status_dropdown_cubit.dart';
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
  const HomeEventWidget({Key? key}) : super(key: key);

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
                  "15 days left*",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Very very very very very very very very very very very very very large description*",
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
  const HomeTimelineWidget({Key? key}) : super(key: key);

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
                  TaskamoLocaleCategories.nextWork.i18n(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const TimelinePopupMenuWidget(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "meeting with mehdi Einali* very very very very very very very very very very very very very very very very very very very very very ",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      color: TaskamoColors.blue,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "IDP planing* very very very very very very very very very very very very very very very very very very very very very very very very ",
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
                    text: '01:34*',
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
                  trailingDatesTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: TaskamoColors.secondaryText,
                  ),
                  leadingDatesTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: TaskamoColors.secondaryText,
                  ),
                ),
              ),
              firstDayOfWeek: 6,
              allowedViews: const [
                CalendarView.day,
              ],
              showCurrentTimeIndicator: true,
              todayHighlightColor: Theme.of(context).primaryColor.withOpacity(0.05),
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
                  if (state is TodoStatusDropdownResult)
                    ..._getTasks(
                      state.status,
                    ),
                  InvisibleTextButtonWidget(
                    text: TaskamoLocaleCategories.seeAllTodo.i18n(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: TaskamoColors.blue),
                    onPressed: () {
                      context.read<TaskamoRouterBloc>().add(TaskScreenEvent());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _getTasks(TodoStatus status) {
    List<Widget> result = [];
    if (status == TodoStatus.todo) {
      result.add(const TodoTodoItem());
      result.add(const TodoTodoItem());
      result.add(const TodoTodoItem());
    } else if (status == TodoStatus.doing) {
      result.add(const DoingTodoItem());
      result.add(const DoingTodoItem());
      result.add(const DoingTodoItem());
    } else {
      result.add(const DoneTodoItem());
      result.add(const DoneTodoItem());
      result.add(const DoneTodoItem());
    }
    return result;
  }
}
