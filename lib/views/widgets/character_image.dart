import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(80),
          child: CachedNetworkImage(
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
            imageUrl: character.image,
          ),
        ),
      ),
    );
  }
}
