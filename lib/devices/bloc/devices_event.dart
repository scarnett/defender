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
