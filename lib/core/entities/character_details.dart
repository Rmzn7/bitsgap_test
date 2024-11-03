import 'package:bitsgap_test/core/enums/gender.dart';
import 'package:bitsgap_test/core/enums/species.dart';
import 'package:bitsgap_test/core/enums/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_details.g.dart';

@JsonSerializable()
class CharacterDetails{
  final int id;
  final String name;
  final String image;
  final Gender gender;
  final Status status;
  final Species species;

  CharacterDetails({
    required this.name,
    required this.image,
    required this.id,
    required this.species,
    required this.status,
    required this.gender,
  });

  factory CharacterDetails.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDetailsToJson(this);
}
