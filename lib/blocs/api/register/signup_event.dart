part of 'signup_bloc.dart';

abstract class SignupEvent {}

class SignupDataChangedEvent extends SignupEvent {
  SignupDataChangedEvent({
    this.email,
    this.password,
    this.name,
    this.passwordConfirm,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? passwordConfirm;
}

class SignupSubmitEvent extends SignupEvent {}
