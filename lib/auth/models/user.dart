import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photo;

  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  static const empty = User(id: '');

  bool get isEmpty => (this == User.empty);

  bool get isNotEmpty => (this != User.empty);

  static User fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        photo,
      ];
}
