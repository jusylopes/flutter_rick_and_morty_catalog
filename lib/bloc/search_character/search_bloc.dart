import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc({required this.repository}) : super(SearchInitial()) {
    on<Search>(onSearch);
  }

  onSearch(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    try {
      List<CharacterModel> characterList =
          await repository.searchCharacter(query: event.query);

      emit(SearchLoaded(characters: characterList));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
