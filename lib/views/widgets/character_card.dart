import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_detail_page.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_status_circle.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterModel character;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: character.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )),
                        imageUrl: character.image,
                      ),
                    ),
                  ),
                  const SizedBox(width: 45),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        character.name,
                        style: CharacterTextStyle.characterName,
                        overflow: TextOverflow.visible,
                      ),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
