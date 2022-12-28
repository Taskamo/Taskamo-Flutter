import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TaskamoAppbar(),
      body: const Center(
        child: Text("Calendar screen"),
      ),
      bottomNavigationBar: const BottomNavigationWidget(activeIndex: 0),
    );
  }
}
