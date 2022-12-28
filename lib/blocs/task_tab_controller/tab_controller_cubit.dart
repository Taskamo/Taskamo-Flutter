import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/utils/enums/todo_enums.dart';

part 'tab_controller_state.dart';

class TabControllerCubit extends Cubit<TabControllerState> {
  TabControllerCubit()
      : super(
          TabControllerState(
            tabStatus: TodoStatus.todo,
          ),
        );

  void todoTab() {
    emit(
      TabControllerState(
        tabStatus: TodoStatus.todo,
      ),
    );
  }

  void doingTab() {
    emit(
      TabControllerState(
        tabStatus: TodoStatus.doing,
      ),
    );
  }

  void doneTab() {
    emit(
      TabControllerState(
        tabStatus: TodoStatus.done,
      ),
    );
  }
}
