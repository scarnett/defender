import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

Map<String, dynamic>? getQRCodeData({
  required Barcode barcode,
}) {
  if (barcode.rawValue != null) {
    try {
      Map<String, dynamic> qrData = json.decode(barcode.rawValue!);
      return qrData;
    } on FormatException catch (e) {
      if (kDebugMode) {
        print('Invalid JSON data: ${barcode.rawValue}');
      }

      return null;
    }
  }

  return null;
}

bool isDefenderQRCode({
  required Barcode barcode,
}) {
  Map<String, dynamic>? qrData = getQRCodeData(barcode: barcode);
  if ((qrData != null) && (qrData['defender'] != null) && qrData['defender'] && (qrData['deviceGuid'] != null)) {
    return true;
  }

  return false;
}
