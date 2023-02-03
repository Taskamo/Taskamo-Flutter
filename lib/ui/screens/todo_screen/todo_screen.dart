import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/api/todo/todo_bloc.dart';
import 'package:taskamo/blocs/task_tab_controller/tab_controller_cubit.dart';
import 'package:taskamo/ui/screens/create_screen/todo.dart';
import 'package:taskamo/ui/screens/todo_screen/todo_widget.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    context.read<TodoBloc>().add(GetTodosEvent());
    super.initState();
  }

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
                        const TodoTabBarWidget(),
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateTodo(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
