import 'package:flutter/cupertino.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

abstract class TaskamoDecoration{
  static BoxDecoration decoration =  BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: TaskamoColors.boxBackground,
  );
}