import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';

import '../services/repository_interface.dart';
import 'character_detail_page.dart';

class CharacterFavoritePage extends StatefulWidget {
  const CharacterFavoritePage({super.key});

  @override
  State<CharacterFavoritePage> createState() => _CharacterFavoritePageState();
}

class _CharacterFavoritePageState extends State<CharacterFavoritePage> {
  List<CharacterModel> characterList = [];
  late IRepository repository;

  @override
  void initState() {
    super.initState();
    loadCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void loadCharacter() async {
    List<CharacterModel> favoriteCharacter =
        await repository.getFavoritesCharacters();

    setState(() {
      characterList = favoriteCharacter;
    });
    
    print(characterList);
  }

  openDetailScreen(CharacterModel character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailPage(character: character),
      ),
    );
  }
}
