import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';

abstract class CharacterTheme {
  static ThemeData get dark => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins'),
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.primaryColor,

      );
}
