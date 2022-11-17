
import 'package:equatable/equatable.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';

abstract class CharactersState extends Equatable {}

class InitialState extends CharactersState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CharactersState {
  @override
  List<Object> get props => [];
}

class SuccessState extends CharactersState {
  SuccessState({required this.characters});
  final List<CharacterModel> characters;

  @override
  List<Object> get props => [characters];
}

class ErrorState extends CharactersState {
  @override
  List<Object> get props => [];
}

