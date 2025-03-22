part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthEmail extends AuthEvent {
  final String email;
  AuthEmail({required this.email});
}

class AuthPassword extends AuthEvent {
  final String password;
  AuthPassword({required this.password});
}

class AuthSumbitted extends AuthEvent{

}
