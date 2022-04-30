part of 'devices_bloc.dart';

abstract class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object> get props => [];
}

class DevicesSubscriptionRequested extends DevicesEvent {
  const DevicesSubscriptionRequested();
}
