part of 'device_settings_cubit.dart';

@JsonSerializable()
class DeviceSettingsState extends Equatable {
  final Device? device;

  @JsonKey(ignore: true)
  final AppRequiredField name;

  @JsonKey(ignore: true)
  final FormzStatus status;

  @JsonKey(ignore: true)
  final String? errorMessage;

  const DeviceSettingsState({
    this.device,
    this.name = const AppRequiredField.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  DeviceSettingsState copyWith({
    Nullable<Device?>? device,
    AppRequiredField? name,
    FormzStatus? status,
    String? errorMessage,
  }) =>
      DeviceSettingsState(
        device: (device == null) ? this.device : device.value,
        name: name ?? this.name,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        device,
        name,
        status,
      ];
}
