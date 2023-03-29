import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(LoadingState()) {
    on<StartFavoriteList>(_onStartFavoriteList);
    on<AddFavoriteListCharacter>(_onAddFavoriteListCharacter);
    on<RemoveFavoriteListCharacter>(_onRemoveFavoriteListCharacter);
  }

  void _onStartFavoriteList(
      StartFavoriteList event, Emitter<FavoriteState> emit) {
    emit(LoadingState());

    try {
      Future<void>.delayed(const Duration(seconds: 1));
      emit(LoadedState());
    } catch (_) {}
  }

  void _onAddFavoriteListCharacter(
      AddFavoriteListCharacter event, Emitter<FavoriteState> emit) {
    final state = this.state;

    if (state is LoadedState) {
      emit(LoadedState(
          favoriteList: List.from(state.favoriteList)..add(event.character)));
    }
  }

  void _onRemoveFavoriteListCharacter(
      RemoveFavoriteListCharacter event, Emitter<FavoriteState> emit) {}
}
