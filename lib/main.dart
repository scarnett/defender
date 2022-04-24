import 'package:defender/app/bloc/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:defender/app/app.dart';
import 'package:defender/auth/auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp();

  // Hydrated Bloc
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  await authenticationRepository.user.first;

  HydratedBlocOverrides.runZoned(
    () => runApp(App(authenticationRepository: authenticationRepository)),
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
}
