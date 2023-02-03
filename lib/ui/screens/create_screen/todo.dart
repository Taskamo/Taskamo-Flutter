import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/todo/todo_bloc.dart';
import 'package:taskamo/data-models/todo/create_todo.dart';
import 'package:taskamo/ui/widgets/appbar_widget/create_appbar.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/text_field_widget/text_field_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  late TextEditingController title;
  late TextEditingController description;

  bool _getValidations() {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    description = TextEditingController();
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
                            TaskamoLocaleCategories.newTodo.i18n(),
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
                      CreateTodoModel todoModel = CreateTodoModel(
                        title: title.text,
                        description: description.text,
                        status: "todo",
                      );
                      context.read<TodoBloc>().add(
                            CreateTodoEvent(
                              todoModel: todoModel,
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
