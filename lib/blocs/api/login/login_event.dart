part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginDataChangedEvent extends LoginEvent {
  LoginDataChangedEvent({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;
}

class LoginSubmitEvent extends LoginEvent {}
