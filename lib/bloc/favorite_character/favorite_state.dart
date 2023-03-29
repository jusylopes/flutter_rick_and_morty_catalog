part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState extends Equatable {}

class LoadingState extends FavoriteState {
  @override
  List<Object> get props => [];
}

class LoadedState extends FavoriteState {
  final List<CharacterModel> favoriteList;
  LoadedState({this.favoriteList = const <CharacterModel>[]});

  @override
  List<Object> get props => [favoriteList];
}

class ErrorState extends FavoriteState {
  @override
  List<Object> get props => [];
}
