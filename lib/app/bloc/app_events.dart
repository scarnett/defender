part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];

  @override
  String toString() => 'AppEvent{}';
}

class AppLogoutRequested extends AppEvent {
  @override
  String toString() => 'AppLogoutRequested{}';
}

class AppUserChanged extends AppEvent {
  final User user;

  @visibleForTesting
  const AppUserChanged(
    this.user,
  );

  @override
  String toString() => 'AppUserChanged{user: $user}';
}

class AppPackageInfoChanged extends AppEvent {
  final PackageInfo packageInfo;

  const AppPackageInfoChanged(
    this.packageInfo,
  );

  @override
  String toString() => 'AppPackageInfoChanged{packageInfo: $packageInfo}';
}
