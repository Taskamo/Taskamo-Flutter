import 'package:flutter/material.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class DecorationWidget extends StatelessWidget {
  const DecorationWidget({
    Key? key,
    required this.container,
    this.margin,
  }) : super(key: key);
  final Widget container;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: TaskamoColors.backgroundGradient,
      ),
      child: container,
    );
  }
}
