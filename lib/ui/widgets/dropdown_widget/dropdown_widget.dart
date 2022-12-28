import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/status_dropdown/todo_status_dropdown_cubit.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/enums/todo_enums.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class TodoStatusDropDown extends StatefulWidget {
  const TodoStatusDropDown({
    Key? key,
  }) : super(key: key);


  @override
  State<TodoStatusDropDown> createState() => _TodoStatusDropDownState();
}

class _TodoStatusDropDownState extends State<TodoStatusDropDown> {
  String selectedValue = TaskamoLocaleCategories.doing.i18n();
  final List<TaskStatusDropDownItem> _list = [
    TaskStatusDropDownItem(
      status: TodoStatus.todo,
      itemName: TaskamoLocaleCategories.todo.i18n(),
    ),
    TaskStatusDropDownItem(
      status: TodoStatus.doing,
      itemName: TaskamoLocaleCategories.doing.i18n(),
    ),
    TaskStatusDropDownItem(
      status: TodoStatus.done,
      itemName: TaskamoLocaleCategories.done.i18n(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: DropdownButton2(
          style: Theme.of(context).textTheme.headlineMedium,
          isExpanded: true,
          hint: Text(
            selectedValue,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          items:
              _list.map(
                (item) => DropdownMenuItem<String>(
                  onTap: () {
                    context.read<TodoStatusDropdownCubit>().changeStatus(
                          status: item.status,
                        );
                  },
                  value: item.itemName,
                  child: Text(
                    item.itemName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(
              () {
                selectedValue = value as String;
              },
            );
          },
          icon: const IconWidget(
            url: TaskamoIconCategories.arrowDownSmall,
            height: 16,
            width: 16,
            color: TaskamoColors.white,
          ),
          iconOnClick: const IconWidget(
            url: TaskamoIconCategories.arrowRightSmall,
            height: 16,
            width: 16,
            color: TaskamoColors.white,
          ),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 16),
          buttonDecoration: BoxDecoration(
            border: Border.all(
              color: TaskamoColors.white.withOpacity(0.05),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          buttonElevation: 0,
          itemPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: TaskamoColors.secondaryText.withOpacity(0.05),
              width: 1,
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          dropdownElevation: 0,
          scrollbarAlwaysShow: false,
          offset: const Offset(0, 0),
        ),
      ),
    );
  }
}

class TaskStatusDropDownItem {
  TaskStatusDropDownItem({
    required this.status,
    required this.itemName,
  });

  final String itemName;
  final TodoStatus status;
}