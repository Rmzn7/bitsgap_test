import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class CharacterGeneral{
  final int id;
  final String name;
  final String image;

  CharacterGeneral({
    required this.name,
    required this.image,
    required this.id,
  });

  factory CharacterGeneral.fromJson(Map<String, dynamic> json) =>
      _$CharacterGeneralFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterGeneralToJson(this);
}
