import 'package:bloc/bloc.dart';
import 'package:defender/devices/api/model/device.dart';
import 'package:defender/devices/enums/enums.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'devices_event.dart';
part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  final DevicesRepository _devicesRepository;

  DevicesBloc({
    required DevicesRepository devicesRepository,
  })  : _devicesRepository = devicesRepository,
        super(const DevicesState()) {
    on<DevicesSubscriptionRequested>(_onSubscriptionRequested);
    on<DevicesActivation>(_onActivateDevice);
  }

  Future<void> _onSubscriptionRequested(
    DevicesSubscriptionRequested event,
    Emitter<DevicesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: () => DevicesStatus.loading,
      ),
    );

    await emit.forEach<List<Device>>(
      _devicesRepository.devices(),
      onData: (List<Device> devices) => state.copyWith(
        status: () => DevicesStatus.success,
        devices: () => devices,
      ),
      onError: (_, __) => state.copyWith(
        status: () => DevicesStatus.failure,
      ),
    );
  }

  Future<void> _onActivateDevice(
    DevicesActivation event,
    Emitter<DevicesState> emit,
  ) async {
    emit(
      state.copyWith(
        activeDevice: () => event.device,
      ),
    );
  }
}
