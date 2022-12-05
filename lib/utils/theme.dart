import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/utils/text_styles.dart';

abstract class CharacterTheme {
  static ThemeData get dark => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
          titleTextStyle: CharacterTextStyle.titleAppBar,
          elevation: 0,
        ),
        scaffoldBackgroundColor: AppColors.primaryColor,
        splashColor: AppColors.primaryColor,
        
      );
}
