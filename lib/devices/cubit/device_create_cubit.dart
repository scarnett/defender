import 'package:defender/app/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'device_create_state.dart';

class DeviceCreateCubit extends Cubit<DeviceCreateState> {
  DeviceCreateCubit() : super(const DeviceCreateState());

  void qrCodeDetected(
    Barcode barcode,
  ) {
    emit(
      state.copyWith(
        barcode: Nullable<Barcode?>(barcode),
      ),
    );
  }

  void clearQRCode() {
    emit(
      state.copyWith(
        barcode: Nullable<Barcode?>(null),
      ),
    );
  }
}
