part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileDataState extends ProfileState {
  ProfileDataState({required this.profileModel});

  final ProfileModel profileModel;
}
