import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/data-models/profile/edit_profile_model.dart';
import 'package:taskamo/data-models/profile/profile_model.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.get(
          TaskamoAPICategories.me,
        );
        if (api.status == ResponseStatus.success) {
          ProfileModel profileModel = profileModelFromMap(api.data);
          if (profileModel.profile != null) {
            String finalProfile =
                'http://api.taskamo.com/profile/${profileModel.profile}';
            profileModel.profile = finalProfile;
          }
          emit(
            ProfileDataState(
              profileModel: profileModel,
            ),
          );
        }
      },
    );
    on<EditProfileNameEvent>(
      (event, emit) async {
        await TaskamoApiClient.post(
          TaskamoAPICategories.profile,
          body: editProfileModelToMap(event.editProfileModel),
        );
      },
    );
    on<EditProfileEvent>(
      (event, emit) async {
        await TaskamoApiClient.postWithFile(
          url: TaskamoAPICategories.profile,
          data: {
            "profile": event.editProfileModel.profile,
            "name": event.editProfileModel.name,
            "_method": "PUT",
          },
          image: event.editProfileModel.profile!,
        );
      },
    );
  }
}
