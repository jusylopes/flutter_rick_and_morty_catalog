import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';

abstract class IRepository {
  Future<List<CharacterModel>> getCharacters({required int page});
  Future<List<CharacterModel>> searchCharacter({required String query});
}
