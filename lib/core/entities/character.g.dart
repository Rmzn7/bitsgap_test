// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterGeneral _$CharacterGeneralFromJson(Map<String, dynamic> json) =>
    CharacterGeneral(
      name: json['name'] as String,
      image: json['image'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CharacterGeneralToJson(CharacterGeneral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
