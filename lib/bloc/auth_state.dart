part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ProcessingSignInState extends AuthState {}

class WrongEmailState extends AuthState {
  String errorMessage;
  WrongEmailState({this.errorMessage});
}

class WrongPasswordState extends AuthState {
  String errorMessage;
  WrongPasswordState({this.errorMessage});
}

class SuccessedSignInState extends AuthState {
  User user;
  SuccessedSignInState({@required this.user});
}

class NoConnectionState extends AuthState {}
