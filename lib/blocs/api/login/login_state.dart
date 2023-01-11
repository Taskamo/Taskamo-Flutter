part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginDoneState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginInValidState extends LoginState {}
