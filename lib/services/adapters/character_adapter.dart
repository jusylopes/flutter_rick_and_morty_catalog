import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';

abstract class CharacterAdapter {
  static List<CharacterModel> fromJson(dynamic json) {
    return json['results']
        .map<CharacterModel>((data) => CharacterModel.fromJson(data))
        .toList();
  }
}
