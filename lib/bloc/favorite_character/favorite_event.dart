part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class StartFavoriteList extends FavoriteEvent {}

class AddFavoriteListCharacter extends FavoriteEvent {
  final CharacterModel character;

  const AddFavoriteListCharacter(this.character);
  @override
  List<Object> get props => [character];
}

class RemoveFavoriteListCharacter extends FavoriteEvent {
  final CharacterModel character;

  const RemoveFavoriteListCharacter(this.character);
  @override
  List<Object> get props => [character];
}
