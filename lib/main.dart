import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/theme.dart';
import 'package:flutter_rick_and_morty_catalog/views/widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CharacterTheme.dark,
      home: const HomePage(),
      title: 'Rick and Morty Catalog',
    );
  }
}
