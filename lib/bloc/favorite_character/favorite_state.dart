part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<CharacterModel> favoriteList;

  const FavoriteState({this.favoriteList = const <CharacterModel>[]});


  @override
  List<Object> get props => [favoriteList];
}
