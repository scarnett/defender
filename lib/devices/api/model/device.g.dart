// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      cameraPreview: json['cameraPreview'] as String? ?? '',
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'cameraPreview': instance.cameraPreview,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
