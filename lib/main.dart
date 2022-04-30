import 'package:defender/app/app.dart';
import 'package:defender/app/bloc/app_bloc_observer.dart';
import 'package:defender/auth/auth.dart';
import 'package:defender/devices/api/firestore/firestore.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp();

  // Hydrated Bloc
  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  // Package Info
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // Auth repo
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  // Device repo
  final DevicesRepository devicesRepository = DevicesRepository(devicesApi: DevicesFirebaseApi());

  HydratedBlocOverrides.runZoned(
    () => runApp(App(
      authenticationRepository: authenticationRepository,
      devicesRepository: devicesRepository,
      packageInfo: packageInfo,
    )),
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
}
