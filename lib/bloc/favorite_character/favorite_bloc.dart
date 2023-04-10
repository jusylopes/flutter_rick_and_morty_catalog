import 'package:bloc/bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:equatable/equatable.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<ToggleInFavorites>(_onToggleInFavorites);
  }

  void _onToggleInFavorites(
      ToggleInFavorites event, Emitter<FavoriteState> emit) async {
    final state = this.state;

    if (state.favoriteList.contains(event.character) == false) {
      emit(FavoriteState(
          favoriteList: List.from(state.favoriteList)..add(event.character)));
    } else {
      emit(FavoriteState(
          favoriteList: List.from(state.favoriteList)
            ..remove(event.character)));
    }
  }
}
