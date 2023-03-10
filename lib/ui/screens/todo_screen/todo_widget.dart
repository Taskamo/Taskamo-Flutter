import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/todo/todo_bloc.dart';
import 'package:taskamo/blocs/task_tab_controller/tab_controller_cubit.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/task_widget/task_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/enums/todo_enums.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class TodoTabBarWidget extends StatelessWidget {
  const TodoTabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, TabControllerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: TextButtonWidget(
                  margin: const EdgeInsets.all(4),
                  color: (state.tabStatus == TodoStatus.todo)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Theme.of(context).backgroundColor,
                  text: TaskamoLocaleCategories.todo.i18n(),
                  style: (state.tabStatus == TodoStatus.todo)
                      ? Theme.of(context).textTheme.titleMedium!.apply(
                            color: Theme.of(context).primaryColor,
                          )
                      : Theme.of(context).textTheme.titleMedium,
                  border: (state.tabStatus == TodoStatus.todo)
                      ? Border.all(
                          color: Theme.of(context).primaryColor,
                        )
                      : Border.all(
                          color: Colors.transparent,
                        ),
                  onPressed: () {
                    context.read<TabControllerCubit>().todoTab();
                  },
                ),
              ),
              Expanded(
                child: TextButtonWidget(
                  margin: const EdgeInsets.all(4),
                  color: (state.tabStatus == TodoStatus.doing)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Theme.of(context).backgroundColor,
                  text: TaskamoLocaleCategories.doing.i18n(),
                  style: (state.tabStatus == TodoStatus.doing)
                      ? Theme.of(context).textTheme.titleMedium!.apply(
                            color: Theme.of(context).primaryColor,
                          )
                      : Theme.of(context).textTheme.titleMedium,
                  border: (state.tabStatus == TodoStatus.doing)
                      ? Border.all(
                          color: Theme.of(context).primaryColor,
                        )
                      : Border.all(
                          color: Colors.transparent,
                        ),
                  onPressed: () {
                    context.read<TabControllerCubit>().doingTab();
                  },
                ),
              ),
              Expanded(
                child: TextButtonWidget(
                  margin: const EdgeInsets.all(4),
                  color: (state.tabStatus == TodoStatus.done)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Theme.of(context).backgroundColor,
                  text: TaskamoLocaleCategories.done.i18n(),
                  style: (state.tabStatus == TodoStatus.done)
                      ? Theme.of(context).textTheme.titleMedium!.apply(
                            color: Theme.of(context).primaryColor,
                          )
                      : Theme.of(context).textTheme.titleMedium,
                  border: (state.tabStatus == TodoStatus.done)
                      ? Border.all(
                          color: Theme.of(context).primaryColor,
                        )
                      : Border.all(
                          color: Colors.transparent,
                        ),
                  onPressed: () {
                    context.read<TabControllerCubit>().doneTab();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabControllerCubit, TabControllerState>(
      builder: (context, state) {
        return BlocBuilder<TodoBloc, TodoState>(
          builder: (context, todos) {
            if (todos is! TodosState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              List<Widget> list = _getTasks(
                todos: todos,
                status: state.tabStatus,
              );
              if (list.isNotEmpty) {
                return DecorationWidget(
                  margin: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                  child: Container(
                    decoration: TaskamoDecoration.decoration,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Column(
                      children: list,
                    ),
                  ),
                );
              }
              return const SizedBox();
            }
          },
        );
      },
    );
  }

  List<Widget> _getTasks({
    required TodosState todos,
    required TodoStatus status,
  }) {
    List<Widget> result = [];
    if (status == TodoStatus.todo) {
      for (var element in todos.todos) {
        result.add(
          TodoTodoItem(
            todo: element,
          ),
        );
      }
    } else if (status == TodoStatus.doing) {
      for (var element in todos.doings) {
        result.add(
          DoingTodoItem(
            todo: element,
          ),
        );
      }
    } else {
      for (var element in todos.dons) {
        result.add(
          DoneTodoItem(
            todo: element,
          ),
        );
      }
    }
    return result;
  }
}
