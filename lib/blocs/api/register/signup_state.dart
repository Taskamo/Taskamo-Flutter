part of 'signup_bloc.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupDoneState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupValidState extends SignupState {}

class SignupInvalidState extends SignupState {}
