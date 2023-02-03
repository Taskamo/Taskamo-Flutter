part of 'todo_bloc.dart';

abstract class TodoEvent {}

class GetTodosEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  DeleteTodoEvent({
    required this.id,
  });

  final int id;
}

class EditTodoEvent extends TodoEvent {
  EditTodoEvent({
    required this.todoModel,
    required this.id,
  });

  final int id;
  final CreateTodoModel todoModel;
}

class CreateTodoEvent extends TodoEvent {
  CreateTodoEvent({
    required this.todoModel,
  });

  final CreateTodoModel todoModel;
}
