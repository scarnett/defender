import 'package:defender/devices/cubit/cubit.dart';
import 'package:defender/devices/extensions/extensions.dart';
import 'package:defender/devices/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class DeviceQrScanner extends StatefulWidget {
  const DeviceQrScanner({
    Key? key,
  }) : super(key: key);

  @override
  _DeviceQrScannerState createState() => _DeviceQrScannerState();
}

class _DeviceQrScannerState extends State<DeviceQrScanner> {
  bool detected = false;

  MobileScannerController cameraController = MobileScannerController(
    formats: [
      BarcodeFormat.qrCode,
    ],
  );

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocProvider(
        create: (BuildContext context) => DeviceCreateCubit(),
        child: BlocListener<DeviceCreateCubit, DeviceCreateState>(
          listener: (
            BuildContext context,
            DeviceCreateState state,
          ) {
            final Barcode? barcode = state.barcode;
            detected = (barcode != null);
          },
          child: BlocBuilder<DeviceCreateCubit, DeviceCreateState>(
            builder: (
              BuildContext context,
              DeviceCreateState state,
            ) {
              if (detected) {
                return Text(state.barcode!.getDevice()!.id);
              }

              return MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (
                  Barcode barcode,
                  MobileScannerArguments? args,
                ) {
                  if (barcode.rawValue == null) {
                    context.read<DeviceCreateCubit>().clearQRCode();
                  } else if (isDefenderQRCode(barcode: barcode)) {
                    context.read<DeviceCreateCubit>().qrCodeDetected(barcode);
                  }
                },
              );
            },
          ),
        ),
      );
}
