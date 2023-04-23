import 'package:dio/dio.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  group('Repository Character', () {
    final dio = DioMock();
    late Repository repository;
    final response = Response(
      statusCode: 200,
      data: jsonMock,
      requestOptions: RequestOptions(path: '/'),
    );

    when(() => dio.get(any())).thenAnswer((_) async => response);

    setUp(() {
      repository = Repository(dio);
    });

    group('getCharacters', () {
      const int page = 1;

      test('should return list of CharacterModel on success', () async {
        final characters = await repository.getCharacters(page: page);

        expect(characters, isInstanceOf<List<CharacterModel>>());
        expect(characters.length, equals(3));
        expect(characters[0].name, 'Rick Sanchez');
      });
    });

    group('searchCharacter', () {
      const query = 'morty';

      test('should return list of CharacterModel on success', () async {
        final characters = await repository.searchCharacter(query: query);

        expect(characters, isInstanceOf<List<CharacterModel>>());
        expect(characters.length, 3);
        expect(characters[1].name, 'Morty Smith');
      });
    });
  });
}

final jsonMock = {
  "results": [
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
    },
    {
      "id": 2,
      "name": "Morty Smith",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {"name": "unknown", "url": ""},
      "location": {
        "name": "Citadel of Ricks",
        "url": "https://rickandmortyapi.com/api/location/3"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
      ],
      "url": "https://rickandmortyapi.com/api/character/2",
      "created": "2017-11-04T18:50:21.651Z"
    },
    {
      "id": 3,
      "name": "Summer Smith",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Female",
      "origin": {
        "name": "Earth (Replacement Dimension)",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "location": {
        "name": "Earth (Replacement Dimension)",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/6",
        "https://rickandmortyapi.com/api/episode/7",
      ],
      "url": "https://rickandmortyapi.com/api/character/3",
      "created": "2017-11-04T19:09:56.428Z"
    },
  ]
};
