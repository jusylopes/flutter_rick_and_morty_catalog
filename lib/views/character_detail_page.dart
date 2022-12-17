import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_image.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/character_status_circle.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double maxHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CharacterImage(
                    character: character,
                    size: maxHeight * 0.3,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    character.name.toUpperCase(),
                    style: CharacterTextStyle.characterNameDetail,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CharacterStatusCircle(status: character.status),
                      const SizedBox(width: 8),
                      Text(
                        '${character.status} - ${character.species}',
                        style: CharacterTextStyle.characterStatus,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: maxHeight * 0.5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InformationRow(
                            label: 'Gender:',
                            value: character.gender,
                          ),
                          InformationRow(
                            label: 'Origin:',
                            value: character.origin.name,
                          ),
                          InformationRow(
                            label: 'Last known location:',
                            value: character.location.name,
                          ),
                          InformationRow(
                            label: 'Number of episodes:',
                            value: character.episode.length.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class InformationRow extends StatelessWidget {
  const InformationRow({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: CharacterTextStyle.informationTitleRow,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: CharacterTextStyle.informationTextRow,
          ),
        ),
      ],
    );
  }
}
