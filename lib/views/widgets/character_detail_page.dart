import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
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
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double maxHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      width: 180,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(character.image),
                      ),
                    ),
                    Text(
                      character.name,
                      style: CharacterTextStyle.characterName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      height: maxHeight * 0.5,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
