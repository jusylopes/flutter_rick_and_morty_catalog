import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/views/character_card_page.dart';
import 'package:flutter_rick_and_morty_catalog/views/character_favorite_page.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_search.dart';

class CharacterHomePage extends StatefulWidget {
  const CharacterHomePage({super.key});

  @override
  State<CharacterHomePage> createState() => _CharacterHomePageState();
}

class _CharacterHomePageState extends State<CharacterHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const CharacterCardPage(),
    const CharacterFavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                size: 30,
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
      extendBody: true,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Characters',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
