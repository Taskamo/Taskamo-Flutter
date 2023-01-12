import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/data-models/event/create_event.dart';
import 'package:taskamo/data-models/event/events.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';

part 'event_event.dart';

part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<EventEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.get(
          TaskamoAPICategories.event,
        );
        if (api.status == ResponseStatus.success) {
          EventsModel eventsModel = eventsModelFromMap(api.data);
          emit(
            EventsState(
              eventsModel: eventsModel,
            ),
          );
        }
      },
    );
  }
}
