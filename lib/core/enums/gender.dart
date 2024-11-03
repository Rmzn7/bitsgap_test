import 'package:json_annotation/json_annotation.dart';

enum Gender{
  @JsonValue('Male') male,
  @JsonValue('Unknown') unknown,
  @JsonValue('Female') female,
}