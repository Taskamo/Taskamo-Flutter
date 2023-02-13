import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/timeline/timeline_bloc.dart';
import 'package:taskamo/data-models/timeline/create_timeline.dart';
import 'package:taskamo/ui/widgets/appbar_widget/create_appbar.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/text_field_widget/text_field_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class CreateTimeline extends StatefulWidget {
  const CreateTimeline({Key? key}) : super(key: key);

  @override
  State<CreateTimeline> createState() => _CreateTimelineState();
}

class _CreateTimelineState extends State<CreateTimeline> {
  late DateTime now;
  DateTime? startAt;
  DateTime? endAt;
  late TextEditingController title;
  late TextEditingController description;

  bool _getValidation() {
    if (title.text.isNotEmpty &&
        description.text.isNotEmpty &&
        startAt != null &&
        endAt != null) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    description = TextEditingController();
    now = DateTime.now();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          endDrawer: const DrawerWidget(),
          body: CustomScrollView(
            slivers: [
              const CreateAppbar(),
              SliverFillRemaining(
                hasScrollBody: false,
                child: DecorationWidget(
                  margin: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: TaskamoDecoration.decoration,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            TaskamoLocaleCategories.timeLine.i18n(),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFieldWidget(
                            textEditingController: title,
                            label: TaskamoLocaleCategories.title.i18n(),
                            hint: TaskamoLocaleCategories.title.i18n(),
                            onChange: (value) {
                              setState(
                                () {},
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFieldWidget(
                            textEditingController: description,
                            label: TaskamoLocaleCategories.description.i18n(),
                            hint: TaskamoLocaleCategories.description.i18n(),
                            onChange: (value) {
                              setState(
                                () {},
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              DatePicker.showDateTimePicker(
                                context,
                                theme: DatePickerTheme(
                                  backgroundColor: TaskamoColors.background,
                                  headerColor: TaskamoColors.background,
                                  itemStyle:
                                      Theme.of(context).textTheme.titleMedium!,
                                  cancelStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                        color: TaskamoColors.red,
                                      ),
                                  doneStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                        color: TaskamoColors.blue,
                                      ),
                                ),
                                showTitleActions: true,
                                minTime: now,
                                maxTime: DateTime(2100, 1, 1),
                                onConfirm: (date) {
                                  startAt = date;
                                  setState(() {});
                                },
                                currentTime: now,
                                locale: LocaleType.en,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: TaskamoColors.secondaryText,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TaskamoLocaleCategories.startAt.i18n(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  if (startAt != null)
                                    Text(
                                      "${startAt!.month}/${startAt!.day} | ${startAt!.hour}:${startAt!.minute}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (startAt != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () {
                                DatePicker.showDateTimePicker(
                                  context,
                                  theme: DatePickerTheme(
                                    backgroundColor: TaskamoColors.background,
                                    headerColor: TaskamoColors.background,
                                    itemStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!,
                                    cancelStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(
                                          color: TaskamoColors.red,
                                        ),
                                    doneStyle: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(
                                          color: TaskamoColors.blue,
                                        ),
                                  ),
                                  showTitleActions: true,
                                  minTime: now,
                                  maxTime: DateTime(2100, 1, 1),
                                  onConfirm: (date) {
                                    endAt = date;
                                    setState(() {});
                                  },
                                  currentTime:
                                      startAt?.add(const Duration(hours: 1)),
                                  locale: LocaleType.en,
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: TaskamoColors.secondaryText,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      TaskamoLocaleCategories.endAt.i18n(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    if (endAt != null)
                                      Text(
                                        "${endAt!.month}/${endAt!.day} | ${endAt!.hour}:${endAt!.minute}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: TextButtonWidget(
              color: (_getValidation())
                  ? TaskamoColors.blue
                  : TaskamoColors.blue.withOpacity(0.3),
              margin: const EdgeInsets.all(8),
              text: TaskamoLocaleCategories.submit.i18n(),
              onPressed: (_getValidation())
                  ? () {
                      CreateTimelineModel timeline = CreateTimelineModel(
                        description: description.text,
                        title: title.text,
                        startAt: startAt!,
                        endAt: endAt!,
                      );

                      context.read<TimelineBloc>().add(
                            CreateTimelineEvent(
                              createTimelineModel: timeline,
                            ),
                          );

                      Navigator.of(context).pop();
                    }
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
