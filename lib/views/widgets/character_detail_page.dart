import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          title: Text(
            character.name,
            style: CharacterTextStyle.characterName,
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;

            return SingleChildScrollView(
              child: Stack(
                children: const [],
              ),
            );
          },
        ));
  }
}
