part of 'device_create_cubit.dart';

class DeviceCreateState extends Equatable {
  final Barcode? barcode;

  const DeviceCreateState({
    this.barcode,
  });

  DeviceCreateState copyWith({
    Nullable<Barcode?>? barcode,
  }) =>
      DeviceCreateState(
        barcode: (barcode == null) ? this.barcode : barcode.value,
      );

  @override
  List<Object?> get props => [
        barcode,
      ];
}
