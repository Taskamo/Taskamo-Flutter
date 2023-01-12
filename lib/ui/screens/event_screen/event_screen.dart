import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/api/event/event_bloc.dart';
import 'package:taskamo/ui/screens/event_screen/event_widget.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(GetEventsEvent());
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
                      const Events(),
                      const SizedBox(height: 75),
                    ],
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationWidget(activeIndex: 2),
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
