import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'taskamo_event.dart';

part 'taskamo_state.dart';

class TaskamoRouterBloc extends Bloc<TaskamoRouterEvent, TaskamoRouterState> {
  TaskamoRouterBloc() : super(TaskamoInitial()) {
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
  }
}
