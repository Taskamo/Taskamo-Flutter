part of 'timeline_bloc.dart';

abstract class TimelineEvent {}

class GetTimelinesEvent extends TimelineEvent {
  GetTimelinesEvent({required this.date});

  final String date;
}

class DeleteTimelineEvent extends TimelineEvent {
  DeleteTimelineEvent({
    required this.id,
  });

  final int id;
}

class EditTimelineEvent extends TimelineEvent {
  EditTimelineEvent({
    required this.id,
    required this.createTimelineModel,
  });

  final int id;
  final CreateTimelineModel createTimelineModel;
}

class CreateTimelineEvent extends TimelineEvent {
  CreateTimelineEvent({required this.createTimelineModel});

  final CreateTimelineModel createTimelineModel;
}
