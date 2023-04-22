part of 'character_bloc.dart';

@immutable
abstract class CharacterState extends Equatable {}

class InitialState extends CharacterState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CharacterState {
  @override
  List<Object> get props => [];
}

class SuccessState extends CharacterState {
  SuccessState({required this.characters});
  final List<CharacterModel> characters;

  @override
  List<Object> get props => [characters];
}

class ErrorState extends CharacterState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
