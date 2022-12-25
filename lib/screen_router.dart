import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/router/taskamo_bloc.dart';
import 'package:taskamo/ui/screens/landing_screen/landing_screen.dart';
import 'package:taskamo/ui/screens/login_screen/login_screen.dart';
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
        title: TaskamoLocaleCategories.name.i18n(),
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
            } else if (state is HomeScreenState) {
              //home
            } else if (state is TimeLineScreenState) {
              //timeline
            } else if (state is EventScreenState) {
              //event
            } else if (state is TaskScreenState) {
              //task
            } else if (state is CalendarScreenState) {
              //calendar
            } else {
              //loading

            }
            return const Scaffold();
          },
        ),
      ),
    );
  }
}
