import 'package:bitsgap_test/core/entities/character.dart';
import 'package:bitsgap_test/core/entities/character_details.dart';
import 'package:bitsgap_test/core/repository/general_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'characters_store.g.dart';

class CharactersStore = _CharactersStore with _$CharactersStore;

abstract class _CharactersStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  late ObservableFuture<List<CharacterGeneral>> charactersListFuture;

  @observable
  late ObservableFuture<CharacterDetails> characterDetailsFuture;

  @action
  Future fetchCharacters() => charactersListFuture = ObservableFuture(
      httpClient.getCharacters().then((characters) => characters));

  void getTheCharacters() {
    fetchCharacters();
  }

  @action
  Future fetchCharacterDetails(String id) =>
      characterDetailsFuture = ObservableFuture(
          httpClient.getCharacterDetails(id).then((details) => details));

  void getTheCharacterDetails(String id) {
    fetchCharacterDetails(id);
  }

}
