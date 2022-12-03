import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_status_circle.dart';

class CharacterCardData extends StatelessWidget {
  const CharacterCardData({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            character.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CharacterTextStyle.characterName,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: <Widget>[
            CharacterStatusCircle(status: character.status),
            const SizedBox(width: 5),
            Text(
              '${character.status} - ${character.species}',
              style: CharacterTextStyle.characterStatus,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
