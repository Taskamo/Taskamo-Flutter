import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/data-models/todo/create_todo.dart';
import 'package:taskamo/data-models/todo/todos.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<GetTodosEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.get(
          TaskamoAPICategories.todo,
        );
        if (api.status == ResponseStatus.success) {
          TodosModel todosModel = todosModelFromMap(api.data);
          List<Todo> todos = [];
          List<Todo> doings = [];
          List<Todo> dons = [];
          for (var element in todosModel.data) {
            if (element.status == "todo") {
              todos.add(element);
            }
            if (element.status == "doing") {
              doings.add(element);
            }
            if (element.status == "done") {
              dons.add(element);
            }
          }
          emit(
            TodosState(
              todos: todos,
              doings: doings,
              dons: dons,
            ),
          );
        }
      },
    );
    on<DeleteTodoEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.delete(
          "${TaskamoAPICategories.todo}/${event.id}",
        );
        if (api.status == ResponseStatus.success) {
          add(GetTodosEvent());
        }
      },
    );
    on<EditTodoEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.put(
          "${TaskamoAPICategories.todo}/${event.id}",
          body: createTodoModelToMap(event.todoModel),
        );
        if (api.status == ResponseStatus.success) {
          add(GetTodosEvent());
        }
      },
    );
    on<CreateTodoEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.post(
          TaskamoAPICategories.todo,
          body: createTodoModelToMap(event.todoModel),
        );
        if (api.status == ResponseStatus.success) {
          add(GetTodosEvent());
        }
      },
    );
  }
}
