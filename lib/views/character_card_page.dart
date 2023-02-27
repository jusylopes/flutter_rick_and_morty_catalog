import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/characters_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_card.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_error_message.dart';

class CharacterCardPage extends StatefulWidget {
  const CharacterCardPage({super.key});

  @override
  State<CharacterCardPage> createState() => _CharacterCardPageState();
}

class _CharacterCardPageState extends State<CharacterCardPage> {
  final List<CharacterModel> character = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is InitialState ||
            state is LoadingState && character.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.secondaryColor),
          );
        } else if (state is ErrorState && character.isEmpty) {
          return const CharacterErrorMessage(
            message: 'Error loading characters...',
          );
        } else if (state is SuccessState) {
          character.addAll(state.characters);
        }
        return ListView.builder(
          controller: _scrollController
            ..addListener(() async {
              if (_scrollController.position.pixels ==
                      _scrollController.position.maxScrollExtent &&
                  !BlocProvider.of<CharactersBloc>(context).isFetching) {
                BlocProvider.of<CharactersBloc>(context)
                    .add(LoadCharactersEvent());
              }
            }),
          itemCount: character.length,
          itemBuilder: (context, index) => CharacterCard(
            character: character[index],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}