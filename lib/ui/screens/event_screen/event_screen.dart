import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

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
                    [],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationWidget(activeIndex: 2),
            ),
          ],
        ),
      ),
    );
  }
}
