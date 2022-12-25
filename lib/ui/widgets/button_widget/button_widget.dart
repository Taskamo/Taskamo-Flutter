import 'package:flutter/material.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = 8,
    required this.text,
    this.color = TaskamoColors.blue,
    this.overlay = TaskamoColors.onPress,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.border,
    Key? key,
  }) : super(key: key);

  final double height;
  final double? width;
  final String text;
  final Color color;
  final Color overlay;
  final void Function()? onPressed;
  final double borderRadius;
  final EdgeInsets margin;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        border: border,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              overlayColor: MaterialStateProperty.all<Color>(overlay),
            ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
