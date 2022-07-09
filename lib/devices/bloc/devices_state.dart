part of 'devices_bloc.dart';

class DevicesState extends Equatable {
  final DevicesStatus status;
  final List<Device> devices;
  final Device? activeDevice;

  const DevicesState({
    this.status = DevicesStatus.initial,
    this.devices = const [],
    this.activeDevice,
  });

  DevicesState copyWith({
    DevicesStatus Function()? status,
    List<Device> Function()? devices,
    Device Function()? activeDevice,
  }) =>
      DevicesState(
        status: (status != null) ? status() : this.status,
        devices: (devices != null) ? devices() : this.devices,
        activeDevice: (activeDevice != null) ? activeDevice() : this.activeDevice,
      );

  @override
  List<Object?> get props => [
        status,
        devices,
        activeDevice,
      ];
}
