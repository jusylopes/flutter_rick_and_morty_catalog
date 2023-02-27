import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_search.dart';

class CharacterHomePage extends StatelessWidget {
  const CharacterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The Rick and Morty Catalog',
            ),
            const SizedBox(height: 10),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 40,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CharacterSearch(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
