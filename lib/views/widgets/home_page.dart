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
                    state is LoadingState && _character.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorState && _character.isEmpty) {
                  return const Center(
                    child: Text('erro'),
                  );
                } else if (state is SuccessState) {
                  _character.addAll(state.characters);
                }
                return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
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
                    itemCount: _character.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _character[index].name,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      );
                    });
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
