import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, String> {
  const TimestampConverter();

  @override
  Timestamp fromJson(
    String timestamp,
  ) =>
      Timestamp.fromDate(DateTime.parse(timestamp));

  @override
  String toJson(
    Timestamp timestamp,
  ) =>
      timestamp.toString();
}
