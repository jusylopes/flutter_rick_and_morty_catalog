import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/views/character_detail_page.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_card_data.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_image.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
    required this.maxHeight,
  }) : super(key: key);

  final CharacterModel character;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetailPage(character: character)));
            },
            splashColor: AppColors.primaryColor.withOpacity(0.1),
            child: Ink(
              height: 100,
              width: double.infinity,
              color: AppColors.secondaryColor,
              
              child: Row(
                children: <Widget>[
                  CharacterImage(
                    character: character,
                    size: maxHeight,
                  ),
                  const SizedBox(width: 20),
                  CharacterCardData(character: character),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
