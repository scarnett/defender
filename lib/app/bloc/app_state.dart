part of 'app_bloc.dart';

@immutable
class AppState extends Equatable {
  final AppStatus status;
  final User? user;
  final Map<String, dynamic>? packageInfo;

  const AppState({
    this.status = AppStatus.unauthenticated,
    this.user = User.empty,
    this.packageInfo,
  });

  const AppState._({
    this.status = AppStatus.unauthenticated,
    this.user = User.empty,
    this.packageInfo,
  });

  const AppState.initial() : this._();

  const AppState.authenticated(
    User user,
  ) : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  AppState copyWith({
    AppStatus? status,
    User? user,
    Map<String, dynamic>? packageInfo,
  }) =>
      AppState._(
        status: status ?? this.status,
        user: user ?? this.user,
        packageInfo: packageInfo ?? this.packageInfo,
      );

  @override
  List<Object?> get props => [
        status,
        user,
        packageInfo,
      ];

  @override
  String toString() => 'AppState{status: $status, user: $user, packageInfo: $packageInfo}';
}
