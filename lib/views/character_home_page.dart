import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/characters_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_card.dart';

class CharacterHomePage extends StatefulWidget {
  const CharacterHomePage({super.key});

  @override
  State<CharacterHomePage> createState() => _CharacterHomePageState();
}

class _CharacterHomePageState extends State<CharacterHomePage> {
  final List<CharacterModel> character = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'The Rick and Morty Catalog',
          ),
          toolbarHeight: 80,
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 25),
              icon: const Icon(
                Icons.search,
                size: 40,
                color: AppColors.primaryColor,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            final double maxHeight = constraints.maxHeight;

            return BlocBuilder<CharactersBloc, CharactersState>(
              builder: (context, state) {
                if (state is InitialState ||
                    state is LoadingState && character.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.secondaryColor),
                  );
                } else if (state is ErrorState && character.isEmpty) {
                  return const Center(
                    child: Text('erro'),
                  );
                } else if (state is SuccessState) {
                  character.addAll(state.characters);
                }
                return ListView.builder(
                  controller: _scrollController
                    ..addListener(() async {
                      if (_scrollController.position.pixels ==
                              _scrollController.position.maxScrollExtent &&
                          !BlocProvider.of<CharactersBloc>(context)
                              .isFetching) {
                        BlocProvider.of<CharactersBloc>(context)
                            .add(LoadCharactersEvent());
                      }
                    }),
                  itemCount: character.length,
                  itemBuilder: (context, index) => CharacterCard(
                      character: character[index], maxHeight: maxHeight),
                );
              },
            );
          },
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
