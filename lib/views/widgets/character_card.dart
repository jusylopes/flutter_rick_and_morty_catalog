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
  }) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    const double sizeImage = 100;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(sizeImage),
          right: Radius.circular(90),
        ),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CharacterDetailPage(character: character),
                ),
              );
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
                    size: sizeImage,
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
