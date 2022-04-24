import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:defender/app/widgets/widgets.dart';
import 'package:defender/auth/auth.dart';
import 'package:formz/formz.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authenticationRepository;

  AuthCubit(
    this._authenticationRepository,
  ) : super(const AuthState());

  void emailChanged(
    String value,
  ) {
    final AppEmailField email = AppEmailField.dirty(value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(
    String value,
  ) {
    final AppPasswordField password = AppPasswordField.dirty(value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> logInWithCredentials(
    BuildContext context,
  ) async {
    if (!state.status.isValidated) {
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        context: context,
        email: state.email.value,
        password: state.password.value,
      );

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle(
    BuildContext context,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _authenticationRepository.logInWithGoogle(context);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
