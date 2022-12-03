part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {}

class InitialState extends SearchState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SuccessState extends SearchState {
  SuccessState({required this.characters});
  final List<CharacterModel> characters;

  @override
  List<Object> get props => [characters];
}


class ErrorState extends SearchState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
