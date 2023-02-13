part of 'timeline_bloc.dart';

abstract class TimelineState {}

class TimelineInitial extends TimelineState {}

class TimelinesState extends TimelineState {
  TimelinesState({required this.timelinesModel});

  final TimelinesModel timelinesModel;
}
