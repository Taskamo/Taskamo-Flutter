import 'package:flutter/material.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    Key? key,
    this.value = false,
    required this.onChanged,
    required this.text,
  }) : super(key: key);
  final bool value;
  final void Function(bool?) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: const BorderSide(
              width: 1,
              color: TaskamoColors.secondaryText,
              style: BorderStyle.solid,
            )
          ),
          side:  const BorderSide(
            width: 1,
            color: TaskamoColors.secondaryText,
            style: BorderStyle.solid,
          ),
          activeColor: TaskamoColors.blue,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
