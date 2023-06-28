import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/character_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/screens/widgets/character_card.dart';
import 'package:flutter_rick_and_morty_catalog/screens/widgets/character_error_message.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final List<CharacterModel> character = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CharacterBloc, CharacterState>(
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
                    !BlocProvider.of<CharacterBloc>(context).isFetching) {
                  BlocProvider.of<CharacterBloc>(context)
                      .add(LoadCharactersEvent());
                }
              }),
            itemCount: character.length,
            itemBuilder: (context, index) => CharacterCard(
              character: character[index],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
