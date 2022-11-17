import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/cubit/characters/characters_state.dart';
import 'package:flutter_rick_and_morty_catalog/services/repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.repository}) : super(InitialState()) {
    loadAllCharacters();
  }

  final Repository repository;
  int initialPage = 1;
  bool isLoading = false;

  Future<void> loadAllCharacters() async {
    try {
      emit(LoadingState());
      print('loading');
      isLoading = true;

      final response = await repository.loadAllCharacters(page: initialPage);
      initialPage++;
      print(response);
      emit(SuccessState(characters: response));
      isLoading = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}
