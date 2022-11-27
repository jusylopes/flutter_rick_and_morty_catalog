import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/characters_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  return const Center(child: CircularProgressIndicator());
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
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
                            color: AppColors.secondaryColor,
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  character[index].image,
                                  filterQuality: FilterQuality.high,
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      character[index].name,
                                      style: CharacterTextStyle.characterName,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: character[index].status ==
                                                    'Alive'
                                                ? Colors.green
                                                : character[index].status ==
                                                        'Dead'
                                                    ? Colors.red
                                                    : Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${character[index].status} - ${character[index].species}',
                                          style: CharacterTextStyle
                                              .characterStatus,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
