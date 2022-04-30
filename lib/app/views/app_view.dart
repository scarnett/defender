import 'package:defender/app/app.dart';
import 'package:defender/app/bloc/bloc.dart';
import 'package:defender/auth/auth.dart';
import 'package:defender/devices/bloc/devices_bloc.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final DevicesRepository _devicesRepository;
  final PackageInfo _packageInfo;

  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required DevicesRepository devicesRepository,
    required PackageInfo packageInfo,
  })  : _authenticationRepository = authenticationRepository,
        _devicesRepository = devicesRepository,
        _packageInfo = packageInfo,
        super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _authenticationRepository),
          RepositoryProvider.value(value: _devicesRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => AppBloc(
                authenticationRepository: _authenticationRepository,
              )..add(AppPackageInfoChanged(_packageInfo)),
            ),
            BlocProvider(
              create: (BuildContext context) => DevicesBloc(
                devicesRepository: _devicesRepository,
              ),
            ),
          ],
          child: const AppView(),
        ),
      );
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) =>
      MaterialApp(
        theme: appThemeData,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      );
}
