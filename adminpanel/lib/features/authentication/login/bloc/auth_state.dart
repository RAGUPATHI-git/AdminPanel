part of 'auth_bloc.dart';

class AuthState {
  final String email;
  final String password;
  final bool showError;
  final bool isValid;
  final String? eMessage;

  AuthState(
      {
        this.eMessage,
        required this.email,
      required this.password,
      required this.showError,
      required this.isValid,
      });

  factory AuthState.initial() =>
      AuthState(email: '', password: '', showError: false, isValid: false, eMessage: '');
}
