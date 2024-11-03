import 'dart:convert';

import 'package:bitsgap_test/core/entities/character.dart';
import 'package:bitsgap_test/core/entities/character_details.dart';
import 'package:bitsgap_test/core/enums/gender.dart';
import 'package:bitsgap_test/core/enums/species.dart';
import 'package:bitsgap_test/core/enums/status.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<List<CharacterGeneral>> getCharacters() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final characters = (data['results'] as List).map((json) {
        return CharacterGeneral.fromJson(json);
      }).toList();
      return characters;
    } else {
      print("Error in URL");
      return [];
    }
  }

  Future<CharacterDetails> getCharacterDetails(String id) async {
   try{
     final response = await http
         .get(Uri.parse('https://rickandmortyapi.com/api/character/$id'));
     print(response.body);
     if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
       print('AA $data');
       final characterDetails = CharacterDetails.fromJson(data);
       print('BB $characterDetails');
       return characterDetails;
     } else {
       print("Error in URL");
       return CharacterDetails(
           name: 'name',
           image: 'image',
           id: 0,
           species: Species.alien,
           status: Status.unknown,
           gender: Gender.male);
     }
   }
   catch(e){
     print('e is $e');
     return CharacterDetails(
         name: 'name',
         image: 'image',
         id: 0,
         species: Species.alien,
         status: Status.unknown,
         gender: Gender.male);
   }
  }
}
