import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/icons.dart';

class CharacterErrorMessage extends StatelessWidget {
  const CharacterErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            AppIcons.notFound,
            height: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
