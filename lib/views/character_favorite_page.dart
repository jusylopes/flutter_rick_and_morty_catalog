import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';

import '../services/repository_interface.dart';
import 'character_detail_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
