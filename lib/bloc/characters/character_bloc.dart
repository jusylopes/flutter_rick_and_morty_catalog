import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';
import 'package:equatable/equatable.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final Repository repository;
  List<CharacterModel> characterList = [];
  bool isFetching = false;
  int page = 1;

  CharacterBloc({required this.repository}) : super(InitialState()) {
    on<LoadCharactersEvent>((event, emit) async {
      emit(LoadingState());
      isFetching = true;

      try {
        characterList = await repository.getCharacters(page: page);
        isFetching = false;
        emit(SuccessState(characters: characterList));
        page++;
      } catch (e) {
        isFetching = false;
        emit(ErrorState(e.toString()));
      }
    });
  }
}
