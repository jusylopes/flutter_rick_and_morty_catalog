import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';

abstract class CharacterTextStyle {
  static const characterName = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const characterStatus = TextStyle(
    fontSize: 14.0,
    color: Colors.white,
  );

  static const characterNameDetail = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const informationTitleRow = TextStyle(
    fontSize: 18.0,
    color: Colors.grey,
  );

  static const informationTextRow = TextStyle(
    fontSize: 18.0,
    color: Colors.white,
  );

  static const titleAppBar = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const search = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const searchSuggestions = TextStyle(
    color: Colors.white,
    fontSize: 18,
  
  );
}
