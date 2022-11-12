import 'package:defender/devices/api/model/model.dart';
import 'package:defender/devices/utils/utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

extension DeviceQRCodeExtension on Barcode {
  Device? getDevice() {
    if (isDefenderQRCode(barcode: this)) {
      Map<String, dynamic>? data = getQRCodeData(barcode: this);
      if (data != null) {
        return Device(id: data['deviceId']);
      }
    }

    return null;
  }
}
