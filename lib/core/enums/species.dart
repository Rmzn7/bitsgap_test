import 'package:json_annotation/json_annotation.dart';

enum Species{
  @JsonValue('Human') human,
  @JsonValue('Alien') alien,
}
