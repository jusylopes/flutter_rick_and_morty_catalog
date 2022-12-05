import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/bloc/search_character/search_bloc.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_card.dart';

class CharacterSearch extends SearchDelegate {
  CharacterSearch()
      : super(
          searchFieldLabel: 'Search for characters by name...',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: CharacterTextStyle.titleAppBar,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchBloc>(context, listen: false)
        .add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ),
          );
        } else if (state is SearchLoaded) {
          final characters = state.characters;

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int index) =>
                CharacterCard(character: characters[index]),
          );

        } else if (state is SearchError) {
          return const Center(
            child: Text('No Results Found.', style: TextStyle(color: Colors.white)),
          );
        }

        return const Center();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
