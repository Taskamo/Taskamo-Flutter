part of 'event_bloc.dart';

abstract class EventState {}

class EventInitial extends EventState {}

class EventsState extends EventState {
  EventsState({required this.eventsModel});

  final EventsModel eventsModel;
}
