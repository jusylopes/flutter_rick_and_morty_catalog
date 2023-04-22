import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/services/adapters/character_adapter.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository_interface.dart';

import '../utils/constants.dart';

class Repository extends IRepository {
  final dio = Dio();

  @override
  Future<List<CharacterModel>> getCharacters({required int page}) async {
    try {
      Response response = await dio.get('$baseApi/api/character/?page=$page');
      final data = response.data;

      return CharacterAdapter.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacter({required String query}) async {
    try {
      Response response = await dio.get('$baseApi/api/character/?name=$query');
      final data = response.data;

      return CharacterAdapter.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
