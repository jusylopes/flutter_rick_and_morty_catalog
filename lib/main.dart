import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/characters/characters_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';
import 'package:flutter_rick_and_morty_catalog/utils/theme.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/home_page.dart';

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
              ..add(LoadCharactersEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CharacterTheme.dark,
        home: const HomePage(),
        title: 'Rick and Morty Catalog',
      ),
    );
  }
}
