import 'package:flutter/material.dart';

abstract class CharacterTheme {
  static ThemeData get dark => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(

              color: Color(0xff202329),
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins'),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xff202329),
      );
}
