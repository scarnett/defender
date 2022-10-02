import 'package:defender/app/enums/app_status_enum.dart';

extension AppStatusExtension on String {
  AppStatus getAppStatus() {
    switch (this) {
      case 'authenticated':
        return AppStatus.authenticated;

      case 'unauthenticated':
      default:
        return AppStatus.unauthenticated;
    }
  }
}
