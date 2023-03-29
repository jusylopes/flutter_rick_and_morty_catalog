import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_card.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_error_message.dart';
import '../bloc/favorite_character/favorite_bloc.dart';

class CharacterFavoritePage extends StatefulWidget {
  const CharacterFavoritePage({super.key});

  @override
  State<CharacterFavoritePage> createState() => _CharacterFavoritePageState();
}

class _CharacterFavoritePageState extends State<CharacterFavoritePage> {
  final List<CharacterModel> favoriteList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is LoadingState && favoriteList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.secondaryColor),
            );
          } else if (state is ErrorState) {
            return const CharacterErrorMessage(
              message: 'Error loading favorite characters...',
            );
          } else if (state is LoadedState) {
            favoriteList.addAll(state.favoriteList);

            return ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) => CharacterCard(
                character: favoriteList[index],
              ),
            );
          }
          return const Center();
        },
      ),
    );
  }
}
