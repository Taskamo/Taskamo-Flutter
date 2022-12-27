part of 'todo_status_dropdown_cubit.dart';

abstract class TodoStatusDropdownState {}

class TodoStatusDropdownInitial extends TodoStatusDropdownState {}

class TodoStatusDropdownResult extends TodoStatusDropdownState {
  TodoStatusDropdownResult({
    required this.status,
  });

  final TodoStatus status;
}
