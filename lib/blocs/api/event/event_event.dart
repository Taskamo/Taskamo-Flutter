part of 'event_bloc.dart';

abstract class EventEvent {}

class GetEventsEvent extends EventEvent {}

class DeleteEventEvent extends EventEvent {
  DeleteEventEvent({
    required this.id,
  });

  final int id;
}

class EditEventEvent extends EventEvent {
  EditEventEvent({
    required this.id,
    required this.eventModel,
  });

  final int id;
  final CreateEventModel eventModel;
}

class CreateEventEvent extends EventEvent {
  CreateEventEvent({
    required this.eventModel,
  });

  final CreateEventModel eventModel;
}
