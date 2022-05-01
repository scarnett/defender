import 'dart:async';

import 'package:defender/app/app.dart';
import 'package:defender/auth/auth.dart';
import 'package:defender/auth/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_events.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppPackageInfoChanged>(_onPackageInfoChanged);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {
    AppState authState = event.user.isNotEmpty ? AppState.authenticated(event.user) : const AppState.unauthenticated();
    emit(state.copyWith(user: authState.user, status: authState.status));
  }

  void _onPackageInfoChanged(
    AppPackageInfoChanged event,
    Emitter<AppState> emit,
  ) =>
      emit(state.copyWith(packageInfo: {
        'version': event.packageInfo.version,
        'buildNumber': event.packageInfo.buildNumber,
      }));

  void _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) =>
      unawaited(_authenticationRepository.logOut());

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  @override
  AppState fromJson(
    Map<String, dynamic> json,
  ) =>
      AppState(
        status: json['status'].appStatus,
        user: User.fromJson(json['user']),
        packageInfo: json['packageInfo'],
      );

  @override
  Map<String, dynamic> toJson(
    AppState state,
  ) =>
      {
        'status': state.status.toString(),
        'user': state.user?.toJson(),
        'packageInfo': state.packageInfo,
      };
}
