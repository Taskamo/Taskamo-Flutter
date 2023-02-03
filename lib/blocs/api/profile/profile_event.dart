part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  EditProfileEvent({required this.editProfileModel});

  final EditProfileModel editProfileModel;
}
