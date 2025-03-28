import 'package:adminpanel/features/authentication/login/data/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthState.initial()) {
    on<AuthEmail>((event, emit) {
      emit(AuthState(
          email: event.email,
          password: state.password,
          showError: false,
          isValid: event.email.isNotEmpty && state.password.length > 5));
    });

    on<AuthPassword>((event, emit) {
      emit(AuthState(
          email: state.email,
          password: event.password,
          showError: false,
          isValid: state.email.isNotEmpty && event.password.length > 5));
    });

    on<AuthSumbitted>((event, emit) async {
      AuthState(
        email: state.email,
        password: state.password,
        isValid: state.isValid,
        showError: true,
      );
      if (state.isValid) {
        try {
          await authRepository.signIn(state.email, state.password);
          print('Login Successful');
        } catch (e) {
          emit(AuthState(
              email: '', password: '', showError: true, isValid: false, eMessage: e.toString()));
          print('Login Failed..: $e');
        }
      }
    });
  }
}
