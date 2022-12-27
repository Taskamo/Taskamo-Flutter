import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/blocs/status_dropdown/todo_status_dropdown_cubit.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/dropdown_widget/dropdown_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/ui/widgets/time_widget/time_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/enums/todo_enums.dart';
import 'package:taskamo/utils/functions/calendar_date_time/calendar_date_time.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class HomeEventWidget extends StatelessWidget {
  const HomeEventWidget({Key? key}) : super(key: key);

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
      container: Container(
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
                IconButtonWidget(
                  widget: const IconWidget(
                    url: TaskamoIconCategories.more,
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {
                    //TODO here
                  },
                ),
              ],
            ),
            Text(
              "meeting with mehdi Einali* very very very very very very very very very very very very very very very very very very very very very ",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    color: TaskamoColors.blue,
                  ),
              textAlign: TextAlign.left,
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
      container: Container(
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
            TableCalendar(
              availableGestures: AvailableGestures.none,
              firstDay: TaskamoDateTime.getStartOfMonth(),
              lastDay: TaskamoDateTime.getEndOfMonth(),
              focusedDay: DateTime.now(),
              startingDayOfWeek: StartingDayOfWeek.saturday,
              daysOfWeekVisible: false,
              headerVisible: false,
              weekNumbersVisible: false,
              weekendDays: const [
                DateTime.friday,
              ],
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(),
                disabledTextStyle:
                    Theme.of(context).textTheme.bodyMedium!.apply(
                          color: TaskamoColors.secondaryText,
                        ),
                todayTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TaskamoColors.blue,
                    ),
                weekendTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TaskamoColors.red,
                    ),
                defaultTextStyle: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetDaysOfTheWeekWidget extends StatelessWidget {
  const GetDaysOfTheWeekWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.sat.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.sun.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.mon.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.tue.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.wed.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.thu.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.fri.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
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
            container: Container(
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

class DoingTodoItem extends StatelessWidget {
  const DoingTodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.white.withOpacity(0.05),
        border: Border.all(
          color: TaskamoColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Very very very very very very very large Title*",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TaskamoColors.yellow.withOpacity(0.1),
                ),
                child: Text(
                  TaskamoLocaleCategories.doing.i18n(),
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: TaskamoColors.yellow,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: TaskamoColors.red.withOpacity(0.1),
                overlay: Colors.transparent,
                widget: const IconWidget(
                  url: TaskamoIconCategories.bin,
                  height: 16,
                  width: 16,
                ),
                onPressed: () {},
              ),
              Expanded(
                flex: 4,
                child: TextButtonWidget(
                  color: TaskamoColors.blue.withOpacity(0.1),
                  overlay: Colors.transparent,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.dropToDone.i18n(),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoneTodoItem extends StatelessWidget {
  const DoneTodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.white.withOpacity(0.05),
        border: Border.all(
          color: TaskamoColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Very very very very very very very large Title*",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TaskamoColors.yellow.withOpacity(0.1),
                ),
                child: Text(
                  TaskamoLocaleCategories.done.i18n(),
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: TaskamoColors.yellow,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                color: TaskamoColors.red.withOpacity(0.1),
                overlay: Colors.transparent,
                widget: const IconWidget(
                  url: TaskamoIconCategories.bin,
                  height: 16,
                  width: 16,
                ),
                onPressed: () {},
              ),
              // Expanded(
              //   flex: 4,
              //   child: TextButtonWidget(
              //     color: TaskamoColors.blue.withOpacity(0.1),
              //     overlay: Colors.transparent,
              //     style: Theme.of(context).textTheme.bodyMedium!.apply(
              //       color: TaskamoColors.blue,
              //     ),
              //     text: TaskamoLocaleCategories.dropToDone.i18n(),
              //     onPressed: () {},
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class TodoTodoItem extends StatelessWidget {
  const TodoTodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.white.withOpacity(0.05),
        border: Border.all(
          color: TaskamoColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Very very very very very very very large Title*",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TaskamoColors.yellow.withOpacity(0.1),
                ),
                child: Text(
                  TaskamoLocaleCategories.todo.i18n(),
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: TaskamoColors.yellow,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: TaskamoColors.red.withOpacity(0.1),
                overlay: Colors.transparent,
                widget: const IconWidget(
                  url: TaskamoIconCategories.bin,
                  height: 16,
                  width: 16,
                ),
                onPressed: () {},
              ),
              Expanded(
                flex: 4,
                child: TextButtonWidget(
                  color: TaskamoColors.blue.withOpacity(0.1),
                  overlay: Colors.transparent,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.dropToDoing.i18n(),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}