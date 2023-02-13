import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/data-models/timeline/create_timeline.dart';
import 'package:taskamo/data-models/timeline/timelines.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';

part 'timeline_event.dart';

part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc() : super(TimelineInitial()) {
    on<GetTimelinesEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.get(
          TaskamoAPICategories.timeline,
          query: {
            "date": event.date,
          },
        );
        if (api.isSuccess()) {
          TimelinesModel timelinesModel = timelinesModelFromMap(api.data);
          emit(
            TimelinesState(
              timelinesModel: timelinesModel,
            ),
          );
        }
      },
    );
    on<DeleteTimelineEvent>(
      (event, emit) async {
        await TaskamoApiClient.delete(
          "${TaskamoAPICategories.timeline}/${event.id}",
        );
      },
    );
    on<EditTimelineEvent>(
      (event, emit) async {
        await TaskamoApiClient.put(
          "${TaskamoAPICategories.timeline}/${event.id}",
          body: createTimelineModelToMap(event.createTimelineModel),
        );
      },
    );
    on<CreateTimelineEvent>(
      (event, emit) async {
        await TaskamoApiClient.post(
          TaskamoAPICategories.timeline,
          body: createTimelineModelToMap(event.createTimelineModel),
        );
      },
    );
  }
}
