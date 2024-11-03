// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetails _$CharacterDetailsFromJson(Map<String, dynamic> json) =>
    CharacterDetails(
      name: json['name'] as String,
      image: json['image'] as String,
      id: (json['id'] as num).toInt(),
      species: $enumDecode(_$SpeciesEnumMap, json['species']),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$CharacterDetailsToJson(CharacterDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'gender': _$GenderEnumMap[instance.gender]!,
      'status': _$StatusEnumMap[instance.status]!,
      'species': _$SpeciesEnumMap[instance.species]!,
    };

const _$SpeciesEnumMap = {
  Species.human: 'Human',
  Species.alien: 'Alien',
};

const _$StatusEnumMap = {
  Status.alive: 'Alive',
  Status.unknown: 'Unknown',
  Status.dead: 'Dead',
};

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.unknown: 'Unknown',
  Gender.female: 'Female',
};
