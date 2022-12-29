import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskamo/ui/screens/calendar_screen/calendar_widget.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/calendar_controller/calendar_contrller.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarController controller;

  @override
  void initState() {
    super.initState();
    controller = CalendarController();
    controller.displayDate = DateTime.now();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const TaskamoAppbar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      CalendarRowController(controller: controller),
                      const SizedBox(height: 4),
                      CalendarWidget(controller: controller),
                      const CalendarEventOfMonthWidget(),
                      const SizedBox(height: 75),
                    ],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationWidget(activeIndex: 0),
            ),
            Positioned(
              bottom: 98,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Theme.of(context).primaryColor,
                child: const IconWidget(
                  url: TaskamoIconCategories.plus,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
