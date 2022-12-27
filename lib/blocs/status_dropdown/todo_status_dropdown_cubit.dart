import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/utils/enums/todo_enums.dart';

part 'todo_status_dropdown_state.dart';

class TodoStatusDropdownCubit extends Cubit<TodoStatusDropdownState> {
  TodoStatusDropdownCubit() : super(TodoStatusDropdownInitial());

  void changeStatus({
    required TodoStatus status,
  }) {
    emit(
      TodoStatusDropdownResult(
        status: status,
      ),
    );
  }
}
