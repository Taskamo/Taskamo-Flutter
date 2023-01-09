import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/task_tab_controller/tab_controller_cubit.dart';
import 'package:taskamo/ui/screens/task_screen/task_widget.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabControllerCubit(),
      child: SafeArea(
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
                        const TaskTabBarWidget(),
                        const TabViewWidget(),
                        const SizedBox(height: 75),
                      ],
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavigationWidget(activeIndex: 1),
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
      ),
    );
  }
}
