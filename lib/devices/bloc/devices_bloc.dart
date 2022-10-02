import 'package:defender/devices/api/model/device.dart';
import 'package:defender/devices/enums/enums.dart';
import 'package:defender/devices/extensions/extensions.dart';
import 'package:defender/devices/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'devices_event.dart';
part 'devices_state.dart';

class DevicesBloc extends HydratedBloc<DevicesEvent, DevicesState> {
  final DevicesRepository _devicesRepository;

  DevicesBloc({
    required DevicesRepository devicesRepository,
  })  : _devicesRepository = devicesRepository,
        super(const DevicesState()) {
    on<DevicesSubscriptionRequested>(_onSubscriptionRequested);
  }

  Future<void> _onSubscriptionRequested(
    DevicesSubscriptionRequested event,
    Emitter<DevicesState> emit,
  ) async {
    emit(state.copyWith(status: () => DevicesStatus.loading));

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

  @override
  DevicesState fromJson(
    Map<String, dynamic> json,
  ) =>
      DevicesState(
        status: (json['status'] as String).getDeviceStatus(),
      );

  @override
  Map<String, dynamic> toJson(
    DevicesState state,
  ) =>
      {
        'status': state.status.toString(),
      };
}
