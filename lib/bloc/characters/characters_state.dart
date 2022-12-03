part of 'characters_bloc.dart';

@immutable
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
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
