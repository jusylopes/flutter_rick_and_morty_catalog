import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository_interface.dart';

class Repository extends IRepository {
  Repository(this.dio);

  final Dio dio;
  static const _baseApi = 'https://rickandmortyapi.com';

  @override
  Future<List<CharacterModel>> getCharacters({required int page}) async {
    try {
      Response response = await dio.get('$_baseApi/api/character/?page=$page');
      final data = response.data;

      List<CharacterModel> characters = data['results']
          .map<CharacterModel>(
              (characters) => CharacterModel.fromJson(characters))
          .toList();

      return characters;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacter({required String name}) async {
    try {
      Response response = await dio.get('$_baseApi/api/character/?name=$name');
      final data = response.data;

      List<CharacterModel> character = data['results']
          .map<CharacterModel>(
              (characters) => CharacterModel.fromJson(characters))
          .toList();

      return character;
    } catch (e) {
      rethrow;
    }
  }
}
