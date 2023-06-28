import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/screens/widgets/character_card.dart';
import 'package:flutter_rick_and_morty_catalog/screens/widgets/character_error_message.dart';
import '../bloc/favorite_character/favorite_bloc.dart';

class CharacterFavoriteScreen extends StatefulWidget {
  const CharacterFavoriteScreen({super.key});

  @override
  State<CharacterFavoriteScreen> createState() =>
      _CharacterFavoriteScreenState();
}

class _CharacterFavoriteScreenState extends State<CharacterFavoriteScreen> {
  final List<CharacterModel> favoriteList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        if (state.favoriteList.isEmpty) {
          return const CharacterErrorMessage(
            message: '',
          );
        }
        return ListView.builder(
          itemCount: state.favoriteList.length,
          itemBuilder: (context, index) => CharacterCard(
            character: state.favoriteList[index],
          ),
        );
      }),
    );
  }
}
