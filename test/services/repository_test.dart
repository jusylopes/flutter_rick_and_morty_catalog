import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/services/adapters/character_adapter.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Adapters Character', () {
    test('should converting API data to CharacterModel', () async {
      final apiResponse = {
        'results': [
          {
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
              "name": "Earth (C-137)",
              "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
              "name": "Citadel of Ricks",
              "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
              "https://rickandmortyapi.com/api/episode/1",
              "https://rickandmortyapi.com/api/episode/2",
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
          }
        ]
      };

      final List<CharacterModel> characters =
          CharacterAdapter.fromJson(apiResponse);
      final CharacterModel character = characters[0];

      expect(character.name, 'Rick Sanchez');
      expect(character.status, 'Alive');
      expect(character.species, 'Human');
      expect(character.location.name, 'Citadel of Ricks');
    });
  });

  group('Repository Character', () {
    late Repository repository;

    setUp(() {
      repository = Repository();
    });

    group('getCharacters', () {
      const int page = 1;

      test('should return list of CharacterModel on success', () async {
        final characters = await repository.getCharacters(page: page);

        expect(characters, isInstanceOf<List<CharacterModel>>());
        expect(characters.length, isPositive);
        expect(characters[0], isInstanceOf<CharacterModel>());
      });

      test('should throws error on failure', () async {
        expect(() => repository.getCharacters(page: 999), throwsException);
      });
    });

    group('searchCharacter', () {
      const query = 'morty';

      test('should return list of CharacterModel on success', () async {
        final characters = await repository.searchCharacter(query: query);

        expect(characters, isInstanceOf<List<CharacterModel>>());
        expect(characters.length, isPositive);
        expect(characters[0], isInstanceOf<CharacterModel>());
      });

      test('should throws error on failure', () async {
        expect(() => repository.searchCharacter(query: 'personagemQualquer'),
            throwsException);
      });
    });
  });
}
