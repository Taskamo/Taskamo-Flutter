import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/event/event_bloc.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/ui/screens/calendar_screen/calendar_screen.dart';
import 'package:taskamo/ui/screens/event_screen/event_screen.dart';
import 'package:taskamo/ui/screens/home_screen/home_screen.dart';
import 'package:taskamo/ui/screens/landing_screen/landing_screen.dart';
import 'package:taskamo/ui/screens/login_screen/login_screen.dart';
import 'package:taskamo/ui/screens/signup_screen/signup_screen.dart';
import 'package:taskamo/ui/screens/task_screen/task_screen.dart';
import 'package:taskamo/ui/screens/timeline_screen/timeline_screen.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/themes/taskamo_themes.dart';

class TaskamoRouter extends StatelessWidget {
  const TaskamoRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['locale'];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EventBloc(),
        ),
        BlocProvider(
          create: (context) => TaskamoRouterBloc()..add(LandingScreenEvent()),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        localizationsDelegates: [
          // delegate from flutter_localization
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // delegate from localization package.
          LocalJsonLocalization.delegate,
        ],
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        theme: TaskamoTheme.darkTheme,
        color: TaskamoColors.blue,
        debugShowCheckedModeBanner: false,
        title: TaskamoLocaleCategories.taskamo.i18n(),
        home: BlocConsumer<TaskamoRouterBloc, TaskamoRouterState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LandingScreenState) {
              //landing - splash
              return const LandingScreen();
            } else if (state is LoginScreenState) {
              //login
              return const LoginScreen();
            } else if (state is SignupScreenState) {
              //signup
              return const SignupScreen();
            } else if (state is HomeScreenState) {
              //home
              return const HomeScreen();
            } else if (state is TimeLineScreenState) {
              //timeline
              return const TimelineScreen();
            } else if (state is EventScreenState) {
              //event
              return const EventScreen();
            } else if (state is TaskScreenState) {
              //task
              return const TaskScreen();
            } else if (state is CalendarScreenState) {
              //calendar
              return const CalendarScreen();
            }
            //lost
            return const Scaffold();
          },
        ),
      ),
    );
  }
}
