import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/router/taskamo_bloc.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/themes/taskamo_themes.dart';

class TaskamoRouter extends StatelessWidget {
  const TaskamoRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskamoRouterBloc(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        theme: TaskamoTheme.darkTheme,
        color: TaskamoColors.blue,
        debugShowCheckedModeBanner: false,
        title: 'Taskamo',
        home: BlocConsumer<TaskamoRouterBloc, TaskamoRouterState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeScreenState) {
            } else if (state is TimeLineScreenState) {
            } else if (state is EventScreenState) {
            } else if (state is TaskScreenState) {
            } else if (state is CalendarScreenState) {}
            return const Scaffold();
          },
        ),
      ),
    );
  }
}
