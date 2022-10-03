import 'package:flutter/material.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

abstract class TaskamoTheme {
  static ThemeData darkTheme = ThemeData(
    // fontFamily: ,
    backgroundColor: TaskamoColors.background,
    primaryColor: TaskamoColors.blue,
    primarySwatch: MaterialColor(
      TaskamoColors.blue.value,
      {
        50: TaskamoColors.blue.withOpacity(0.05),
        100: TaskamoColors.blue.withOpacity(0.1),
        200: TaskamoColors.blue.withOpacity(0.2),
        300: TaskamoColors.blue.withOpacity(0.3),
        400: TaskamoColors.blue.withOpacity(0.4),
        500: TaskamoColors.blue.withOpacity(0.5),
        600: TaskamoColors.blue.withOpacity(0.6),
        700: TaskamoColors.blue.withOpacity(0.7),
        800: TaskamoColors.blue.withOpacity(0.8),
        900: TaskamoColors.blue.withOpacity(0.9),
      },
    ),
    textTheme: TextTheme(
      //based on weight
      displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: TaskamoColors.white,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: TaskamoColors.white,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: TaskamoColors.white,
      ),
      // headlineLarge: ,
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: TaskamoColors.white,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: TaskamoColors.white,
      ),
      titleLarge:TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: TaskamoColors.white,
      ) ,
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: TaskamoColors.white,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: TaskamoColors.white,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: TaskamoColors.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: TaskamoColors.white,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: TaskamoColors.white,
      ),
      // labelLarge: ,
      // labelMedium: ,
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: TaskamoColors.white,
      ),
    ),
  );
}
