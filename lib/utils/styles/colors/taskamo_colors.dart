import 'package:flutter/material.dart';

abstract class TaskamoColors {
  static const Color blue = Color.fromRGBO(79, 157, 255, 1);
  static const Color yellow = Color.fromRGBO(242, 201, 76, 1);
  static const Color red = Color.fromRGBO(255, 79, 79, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondaryText = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color green = Color.fromRGBO(21, 198, 143, 1);
  static const Color background = Color.fromRGBO(36, 46, 51, 1);
  static const Color boxBackground = Color.fromRGBO(17, 24, 26, 1);
  static const Color onPress = Color.fromRGBO(49, 127, 225, 1);
  static LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      white.withOpacity(0.5),
      black.withOpacity(0.5),
    ],
  );
}
