import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/models/character_model.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';

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
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Container(
                      height: maxHeight *0.8,
                      margin: const EdgeInsets.only(top: 75, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(character.image),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
