import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/cubit/characters/characters_state.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.repository}) : super(InitialState()) {
    loadAllCharacters();
  }

  final Repository repository;

  Future<void> loadAllCharacters() async {
    try {
      emit(LoadingState());
      print('loading');

      final response = await repository.loadAllCharacters(page: 2);

      emit(SuccessState(characters: response));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
