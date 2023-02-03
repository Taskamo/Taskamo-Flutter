part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodosState extends TodoState {
  TodosState({
    required this.todos,
    required this.doings,
    required this.dons,
  });

  final List<Todo> todos;
  final List<Todo> doings;
  final List<Todo> dons;
}
