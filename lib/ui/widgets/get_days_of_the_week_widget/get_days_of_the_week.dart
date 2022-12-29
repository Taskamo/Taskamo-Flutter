import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';

class GetDaysOfTheWeekWidget extends StatelessWidget {
  const GetDaysOfTheWeekWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.sat.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.sun.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.mon.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.tue.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.wed.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.thu.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Transform.rotate(
            angle: -3.14 / 4,
            alignment: Alignment.topLeft,
            child: Text(
              TaskamoLocaleCategories.fri.i18n(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
