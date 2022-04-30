part of 'devices_bloc.dart';

class DevicesState extends Equatable {
  final DevicesStatus status;
  final List<Device> devices;

  const DevicesState({
    this.status = DevicesStatus.initial,
    this.devices = const [],
  });

  DevicesState copyWith({
    DevicesStatus Function()? status,
    List<Device> Function()? devices,
  }) =>
      DevicesState(
        status: (status != null) ? status() : this.status,
        devices: (devices != null) ? devices() : this.devices,
      );

  @override
  List<Object?> get props => [
        status,
        devices,
      ];
}
