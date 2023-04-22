part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class LoadCharactersEvent extends CharacterEvent {
  @override
  List<Object> get props => [];
}
