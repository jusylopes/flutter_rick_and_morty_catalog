import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/characters_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CharacterModel> _character = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'The Rick and Morty Catalog',
          ),
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
                if (state is InitialState || state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorState) {
                  return const Center();
                } else if (state is SuccessState) {
                  _character.addAll(state.characters);
                }
                return ListView.builder(
                    itemCount: _character.length,
                    itemBuilder: (context, index) =>
                        Text(_character[index].name));
              },
            );
          },
        ));
  }
}
