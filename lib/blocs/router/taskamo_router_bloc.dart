import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';
import 'package:taskamo/utils/categories/hive_categories.dart';

part 'taskamo_router_event.dart';

part 'taskamo_router_state.dart';

class TaskamoRouterBloc extends Bloc<TaskamoRouterEvent, TaskamoRouterState> {
  TaskamoRouterBloc() : super(TaskamoInitial()) {
    on<LandingScreenEvent>(
      (event, emit) async {
        emit(LandingScreenState());
        Future.delayed(
          const Duration(seconds: 2),
          () {
            add(LoginScreenEvent());
          },
        );
      },
    );
    on<LoginScreenEvent>(
      (event, emit) async {
        String? accessToken = await TaskamoHiveClient.read(
          key: TaskamoHiveCategories.accessToken,
        );
        if (accessToken != null) {
          emit(HomeScreenState());
        } else {
          emit(LoginScreenState());
        }
      },
    );
    on<SignupScreenEvent>(
      (event, emit) {
        emit(SignupScreenState());
      },
    );
    on<LoadingScreenEvent>(
      (event, emit) {
        emit(LoadingScreenState());
      },
    );
    on<HomeScreenEvent>(
      (event, emit) {
        emit(HomeScreenState());
      },
    );
    on<TimelineScreenEvent>(
      (event, emit) {
        emit(TimeLineScreenState());
      },
    );
    on<EventScreenEvent>(
      (event, emit) {
        emit(EventScreenState());
      },
    );
    on<TodoScreenEvent>(
      (event, emit) {
        emit(TodoScreenState());
      },
    );
    on<CalendarScreenEvent>(
      (event, emit) {
        emit(CalendarScreenState());
      },
    );
    on<LogoutEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.post(
          TaskamoAPICategories.logout,
        );
        if (api.status == ResponseStatus.success) {
          await TaskamoHiveClient.delete(
            key: TaskamoHiveCategories.accessToken,
          );
          add(LandingScreenEvent());
        }
      },
    );
  }
}
