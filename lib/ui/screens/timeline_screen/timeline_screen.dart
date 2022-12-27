import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TaskamoAppbar().build(context),
      body: const Center(
        child: Text("Timeline screen"),
      ),
      bottomNavigationBar: const BottomNavigationWidget(activeIndex: 3),
    );
  }
}
