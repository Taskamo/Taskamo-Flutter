import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TaskamoAppbar().build(context),
      body: const Center(
        child: Text("Task screen"),
      ),
      bottomNavigationBar: const BottomNavigationWidget(activeIndex: 1),
    );
  }
}
