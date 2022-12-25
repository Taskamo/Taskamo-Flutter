import 'package:flutter_bloc/flutter_bloc.dart';

part 'taskamo_event.dart';

part 'taskamo_state.dart';

class TaskamoRouterBloc extends Bloc<TaskamoRouterEvent, TaskamoRouterState> {
  TaskamoRouterBloc() : super(TaskamoInitial()) {
    on<LandingScreenEvent>(
      (event, emit) {
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
      (event, emit) {
        emit(LoginScreenState());
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
    on<TimeLineScreenEvent>(
      (event, emit) {
        emit(TimeLineScreenState());
      },
    );
    on<EventScreenEvent>(
      (event, emit) {
        emit(EventScreenState());
      },
    );
    on<TaskScreenEvent>(
      (event, emit) {
        emit(TaskScreenState());
      },
    );
    on<CalendarScreenEvent>(
      (event, emit) {
        emit(CalendarScreenState());
      },
    );
    on<LogoutEvent>(
      (event, emit) {
        emit(LandingScreenState());
      },
    );
  }
}
