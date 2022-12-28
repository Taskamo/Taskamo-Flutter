import 'package:flutter/material.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius = 8,
    required this.text,
    this.color = TaskamoColors.blue,
    this.overlay = TaskamoColors.onPress,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.border,
    this.style,
    Key? key,
  }) : super(key: key);
  final TextStyle? style;
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
          style: style ?? Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.height = 48,
    this.width = 48,
    this.borderRadius = 8,
    required this.widget,
    this.color = TaskamoColors.blue,
    this.overlay = TaskamoColors.onPress,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.border,
    Key? key,
  }) : super(key: key);

  final double height;
  final double? width;
  final Widget widget;
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
        child: widget,
      ),
    );
  }
}

class InvisibleTextButtonWidget extends StatelessWidget {
  const InvisibleTextButtonWidget({
    this.height = 48,
    this.width = double.infinity,
    required this.text,
    this.margin = EdgeInsets.zero,
    this.style,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double height;
  final double? width;
  final String text;
  final TextStyle? style;
  final void Function()? onPressed;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
        child: Text(
          text,
          style: style ?? Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    this.size = 48,
    required this.widget,
    this.color = Colors.transparent,
    this.overlay = Colors.transparent,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double size;
  final Widget widget;
  final Color color;
  final Color overlay;
  final void Function()? onPressed;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: IconButton(
        icon: widget,
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              overlayColor: MaterialStateProperty.all<Color>(overlay),
            ),
      ),
    );
  }
}
