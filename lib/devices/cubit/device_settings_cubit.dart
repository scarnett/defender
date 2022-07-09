import 'package:bloc/bloc.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'device_settings_state.dart';

class DeviceSettingsCubit extends Cubit<DeviceSettingsState> {
  final DevicesRepository _devicesRepository;

  DeviceSettingsCubit(
    this._devicesRepository,
  ) : super(const DeviceSettingsState());
}
