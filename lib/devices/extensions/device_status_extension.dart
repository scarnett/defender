import 'package:defender/devices/enums/enums.dart';

extension DeviceStatusExtension on String {
  DevicesStatus getDeviceStatus() {
    switch (this) {
      case 'loading':
        return DevicesStatus.loading;

      case 'success':
        return DevicesStatus.success;

      case 'failure':
        return DevicesStatus.failure;

      case 'initial':
      default:
        return DevicesStatus.initial;
    }
  }
}
