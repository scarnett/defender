part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AppEmailField email;
  final AppPasswordField password;
  final FormzStatus status;
  final String? errorMessage;

  const AuthState({
    this.email = const AppEmailField.pure(),
    this.password = const AppPasswordField.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  AuthState copyWith({
    AppEmailField? email,
    AppPasswordField? password,
    FormzStatus? status,
    String? errorMessage,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [
        email,
        password,
        status,
      ];
}
