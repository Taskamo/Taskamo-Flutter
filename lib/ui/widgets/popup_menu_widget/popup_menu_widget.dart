import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class TimelinePopupMenuWidget extends StatelessWidget {
  const TimelinePopupMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: null,
      color: TaskamoColors.black.withOpacity(0.2),
      padding: const EdgeInsets.all(8),
      splashRadius: 8,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none
      ),
      onSelected: (item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
          value: '',
          child: TextButtonWidget(
            text: TaskamoLocaleCategories.edit.i18n(),
            overlay: Colors.transparent,
            onPressed: () {},
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
          value: '',
          child: TextButtonWidget(
            text: TaskamoLocaleCategories.delete.i18n(),
            color: TaskamoColors.red.withOpacity(0.2),
            style: Theme.of(context).textTheme.titleMedium!.apply(
                  color: TaskamoColors.red,
                ),
            overlay: Colors.transparent,
            onPressed: () {},
          ),
        ),
      ],
      child: const IconWidget(
        url: TaskamoIconCategories.more,
        height: 24,
        width: 24,
      ),
    );
  }
}
