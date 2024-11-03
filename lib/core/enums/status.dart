import 'package:json_annotation/json_annotation.dart';

enum Status{
  @JsonValue('Alive') alive,
  @JsonValue('Unknown') unknown,
  @JsonValue('Dead') dead,
}