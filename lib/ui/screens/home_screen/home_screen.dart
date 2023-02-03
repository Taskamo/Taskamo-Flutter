import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/api/event/event_bloc.dart';
import 'package:taskamo/blocs/api/todo/todo_bloc.dart';
import 'package:taskamo/ui/screens/home_screen/home_widget.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TodoBloc>().add(GetTodosEvent());
    context.read<EventBloc>().add(GetEventsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        extendBody: true,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const TaskamoAppbar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const HomeEventWidget(),
                      const HomeTimelineWidget(),
                      const HomeCalendarWidget(),
                      const HomeTaskWidget(),
                      const SizedBox(height: 75),
                    ],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationWidget(activeIndex: 4),
            ),
          ],
        ),
      ),
    );
  }
}
