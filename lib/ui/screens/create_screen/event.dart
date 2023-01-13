import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/event/event_bloc.dart';
import 'package:taskamo/data-models/event/create_event.dart';
import 'package:taskamo/data-models/event/events.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/text_field_widget/text_field_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({
    Key? key,
    this.eventModel,
  }) : super(key: key);
  final EventModel? eventModel;

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  late TextEditingController title;
  late DateTime now;
  late DateTime? selectedDate;
  final Map<String, int> months = {
    "January": 1,
    "February": 2,
    "March": 3,
    "April": 4,
    "May": 5,
    "June": 6,
    "July": 7,
    "August": 8,
    "September": 9,
    "October": 10,
    "November": 11,
    "December": 12,
  };

  bool _getValidations() {
    if (title.text.isNotEmpty && selectedDate != null) {
      return true;
    }
    return false;
  }

  //TODO date picker
  //TODO if event null trigger create event then refresh
  //TODO else trigger edit event then refresh

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    now = DateTime.now();
    if (widget.eventModel != null) {
      title.text = widget.eventModel!.title ?? '';
      selectedDate = DateTime(
        widget.eventModel!.year!,
        months[widget.eventModel!.month!] ?? 1,
        widget.eventModel!.day!,
      );
    } else {
      selectedDate = now;
    }
  }

  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          endDrawer: const LoginDrawerWidget(),
          body: CustomScrollView(
            slivers: [
              const TaskamoAppbar(),
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
                            widget.eventModel == null
                                ? TaskamoLocaleCategories.newEvent.i18n()
                                : TaskamoLocaleCategories.editEvent.i18n(),
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
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate ?? now,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: TaskamoColors.blue,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  TaskamoColors.white),
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                            TaskamoColors.blue.withOpacity(0.3),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // buttonColor: TaskamoColors.red,
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                setState(
                                  () {
                                    selectedDate = pickedDate;
                                  },
                                );
                              }
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
                                    TaskamoLocaleCategories.date.i18n(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "${selectedDate!.month} / ${selectedDate!.day}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
              color: (_getValidations())
                  ? TaskamoColors.blue
                  : TaskamoColors.blue.withOpacity(0.3),
              margin: const EdgeInsets.all(8),
              text: TaskamoLocaleCategories.submit.i18n(),
              onPressed: (_getValidations())
                  ? () {
                      CreateEventModel event = CreateEventModel(
                        date: selectedDate,
                        title: title.text,
                      );
                      if (widget.eventModel != null) {
                        context.read<EventBloc>().add(
                              EditEventEvent(
                                id: widget.eventModel!.id!,
                                eventModel: event,
                              ),
                            );
                      } else {
                        context.read<EventBloc>().add(
                              CreateEventEvent(
                                eventModel: event,
                              ),
                            );
                      }
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
