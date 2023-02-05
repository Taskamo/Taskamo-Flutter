part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class EditProfileNameEvent extends ProfileEvent {
  EditProfileNameEvent({required this.editProfileModel});

  final EditProfileModel editProfileModel;
}

class EditProfileEvent extends ProfileEvent {
  EditProfileEvent({required this.editProfileModel});

  final EditProfileModel editProfileModel;
}
