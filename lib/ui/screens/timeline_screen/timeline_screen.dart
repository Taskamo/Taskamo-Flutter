import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/blocs/api/timeline/timeline_bloc.dart';
import 'package:taskamo/ui/screens/create_screen/timeline.dart';
import 'package:taskamo/ui/screens/timeline_screen/timeline_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/calendar_controller/calendar_contrller.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  late CalendarController controller;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    controller = CalendarController();
    controller.displayDate = now;
    context.read<TimelineBloc>().add(
          GetTimelinesEvent(date: "${now.year}-${now.month}-${now.day}"),
        );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            72,
          ),
          child: const TimelineAppbar(),
        ),
        body: Column(
          children: [
            CalendarRowController(controller: controller),
            Expanded(
              child: TimelineWidget(
                controller: controller,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateTimeline(),
              ),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const IconWidget(
            url: TaskamoIconCategories.plus,
            height: 24,
            width: 24,
          ),
        ),
        bottomNavigationBar: const BottomNavigationWidget(activeIndex: 3),
      ),
    );
  }
}
