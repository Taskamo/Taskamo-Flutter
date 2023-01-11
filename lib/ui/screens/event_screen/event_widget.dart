import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationWidget(
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: TaskamoDecoration.decoration,
        child: Column(
          children: _getEvents(),
        ),
      ),
    );
  }

  List<Widget> _getEvents() {
    List<Widget> result = [];
    result.add(EventWidget());
    result.add(EventWidget());
    result.add(EventWidget());
    return result;
  }
}

class EventWidget extends StatelessWidget {
  EventWidget({Key? key}) : super(key: key);
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TaskamoColors.white.withOpacity(0.1)),
                child: Center(
                  child: Text(
                    "11",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  months[DateTime.now().month - 1],
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Text(
                "4 days left",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TaskamoColors.secondaryText,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Amin's Birthday",
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: TaskamoColors.secondaryText,
                ),
          ),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: TextButtonWidget(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.transparent,
                  overlay: Colors.transparent,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.delete.i18n(),
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButtonWidget(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  color: TaskamoColors.blue.withOpacity(0.1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.edit.i18n(),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
