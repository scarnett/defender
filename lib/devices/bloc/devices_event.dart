part of 'devices_bloc.dart';

abstract class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DevicesEvent{}';
}

class DevicesSubscriptionRequested extends DevicesEvent {
  const DevicesSubscriptionRequested();

  @override
  String toString() => 'DevicesSubscriptionRequested{}';
}

class DevicesActivation extends DevicesEvent {
  final Device device;

  const DevicesActivation(this.device);

  @override
  String toString() => 'DevicesActivation{device: $device}';
}
