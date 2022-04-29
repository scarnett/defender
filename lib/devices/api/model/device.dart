import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'device.g.dart';

@immutable
@JsonSerializable()
class Device extends Equatable {
  final String id;
  final String name;
  final String description;

  Device({
    String? id,
    required this.name,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();
  final bool isCompleted;

  Device copyWith({
    String? id,
    String? name,
    String? description,
    bool? isCompleted,
  }) =>
      Device(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  static Device fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
        description,
        isCompleted,
      ];
}
