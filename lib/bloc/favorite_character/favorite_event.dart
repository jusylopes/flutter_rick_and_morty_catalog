part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object> get props => [];
}

class ToggleInFavorites extends FavoriteEvent {
  final CharacterModel character;

  const ToggleInFavorites(this.character);
  @override
  List<Object> get props => [character];
}
