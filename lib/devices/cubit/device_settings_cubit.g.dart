// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceSettingsState _$DeviceSettingsStateFromJson(Map<String, dynamic> json) =>
    DeviceSettingsState(
      device: json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceSettingsStateToJson(
        DeviceSettingsState instance) =>
    <String, dynamic>{
      'device': instance.device,
    };
