import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defender/app/converters/converters.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'device.g.dart';

@immutable
@JsonSerializable()
class Device extends Equatable {
  final String id;
  final String? name;
  final String? description;
  final String? cameraPreview;

  @TimestampConverter()
  final DateTime? lastUpdated;

  Device({
    String? id,
    this.name,
    this.description,
    this.cameraPreview,
    this.lastUpdated,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should not be empty',
        ),
        id = id ?? const Uuid().v4();

  Device copyWith({
    String? id,
    String? name,
    String? description,
    String? cameraPreview,
    DateTime? lastUpdated,
  }) =>
      Device(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        cameraPreview: cameraPreview ?? this.cameraPreview,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  static Device fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  factory Device.fromFirestore(
    DocumentSnapshot snapshot,
  ) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    data['id'] = snapshot.id;
    data['lastUpdated'] = (data['lastUpdated'] as Timestamp).toDate().toIso8601String();
    return _$DeviceFromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    Map<String, dynamic> data = _$DeviceToJson(this);
    data['lastUpdated'] = Timestamp.fromDate(DateTime.now());
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        cameraPreview,
        lastUpdated,
      ];
}
