import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/characters_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/search_character/search_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';
import 'package:flutter_rick_and_morty_catalog/utils/theme.dart';
import 'package:flutter_rick_and_morty_catalog/views/character_splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final characterRepository = Repository(Dio());

    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(
          create: (_) => CharactersBloc(repository: characterRepository)
            ..add(LoadCharactersEvent()),
        ),
        BlocProvider<SearchBloc>(
            create: (_) => SearchBloc(repository: characterRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CharacterTheme.dark,
        home: const CharacterSplashPage(),
        title: 'Rick and Morty Catalog',
      ),
    );
  }
}
