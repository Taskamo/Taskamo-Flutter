import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/todo/todo_bloc.dart';
import 'package:taskamo/data-models/todo/create_todo.dart';
import 'package:taskamo/data-models/todo/todos.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class DoingTodoItem extends StatelessWidget {
  const DoingTodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.white.withOpacity(0.05),
        border: Border.all(
          color: TaskamoColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${todo.title}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TaskamoColors.yellow.withOpacity(0.1),
                ),
                child: Text(
                  TaskamoLocaleCategories.doing.i18n(),
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: TaskamoColors.yellow,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "${todo.description}",
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: TaskamoColors.secondaryText,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: TextButtonWidget(
                  color: TaskamoColors.blue.withOpacity(0.1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.dropToTodo.i18n(),
                  onPressed: () {
                    context.read<TodoBloc>().add(
                          EditTodoEvent(
                            todoModel: CreateTodoModel(
                              title: todo.title,
                              description: todo.description,
                              status: "todo",
                            ),
                            id: todo.id!,
                          ),
                        );
                  },
                ),
              ),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: TaskamoColors.red.withOpacity(0.1),
                overlay: TaskamoColors.red.withOpacity(0.3),
                widget: const IconWidget(
                  url: TaskamoIconCategories.bin,
                  height: 16,
                  width: 16,
                ),
                onPressed: () {
                  context.read<TodoBloc>().add(
                        DeleteTodoEvent(
                          id: todo.id!,
                        ),
                      );
                },
              ),
              Expanded(
                flex: 4,
                child: TextButtonWidget(
                  color: TaskamoColors.blue.withOpacity(0.1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.dropToDone.i18n(),
                  onPressed: () {
                    context.read<TodoBloc>().add(
                          EditTodoEvent(
                            todoModel: CreateTodoModel(
                              title: todo.title,
                              description: todo.description,
                              status: "done",
                            ),
                            id: todo.id!,
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoneTodoItem extends StatelessWidget {
  const DoneTodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.white.withOpacity(0.05),
        border: Border.all(
          color: TaskamoColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${todo.title}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TaskamoColors.yellow.withOpacity(0.1),
                ),
                child: Text(
                  TaskamoLocaleCategories.done.i18n(),
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: TaskamoColors.yellow,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "${todo.description}",
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: TaskamoColors.secondaryText,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: TextButtonWidget(
                  color: TaskamoColors.blue.withOpacity(0.1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.dropToDoing.i18n(),
                  onPressed: () {
                    context.read<TodoBloc>().add(
                          EditTodoEvent(
                            todoModel: CreateTodoModel(
                              title: todo.title,
                              description: todo.description,
                              status: "doing",
                            ),
                            id: todo.id!,
                          ),
                        );
                  },
                ),
              ),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: TaskamoColors.red.withOpacity(0.1),
                overlay: TaskamoColors.red.withOpacity(0.3),
                widget: const IconWidget(
                  url: TaskamoIconCategories.bin,
                  height: 16,
                  width: 16,
                ),
                onPressed: () {
                  context.read<TodoBloc>().add(
                        DeleteTodoEvent(
                          id: todo.id!,
                        ),
                      );
                },
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TodoTodoItem extends StatelessWidget {
  const TodoTodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TaskamoColors.white.withOpacity(0.05),
        border: Border.all(
          color: TaskamoColors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${todo.title}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TaskamoColors.yellow.withOpacity(0.1),
                ),
                child: Text(
                  TaskamoLocaleCategories.todo.i18n(),
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: TaskamoColors.yellow,
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "${todo.description}",
              style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: TaskamoColors.secondaryText,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: TaskamoColors.red.withOpacity(0.1),
                overlay: TaskamoColors.red.withOpacity(0.3),
                widget: const IconWidget(
                  url: TaskamoIconCategories.bin,
                  height: 16,
                  width: 16,
                ),
                onPressed: () {
                  context.read<TodoBloc>().add(
                        DeleteTodoEvent(
                          id: todo.id!,
                        ),
                      );
                },
              ),
              Expanded(
                flex: 4,
                child: TextButtonWidget(
                  color: TaskamoColors.blue.withOpacity(0.1),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TaskamoColors.blue,
                      ),
                  text: TaskamoLocaleCategories.dropToDoing.i18n(),
                  onPressed: () {
                    context.read<TodoBloc>().add(
                          EditTodoEvent(
                            todoModel: CreateTodoModel(
                              title: todo.title,
                              description: todo.description,
                              status: "doing",
                            ),
                            id: todo.id!,
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
