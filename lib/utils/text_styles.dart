import 'package:flutter/material.dart';

abstract class CharacterTextStyles {
  TextStyle characterName = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextStyle characterStatus = const TextStyle(
    fontSize: 12.0,
    color: Colors.white,
  );
}
