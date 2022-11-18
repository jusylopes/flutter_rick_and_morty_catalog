import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Rick and Morty Catalog',
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 25),
            icon: const Icon(
              Icons.search,
              size: 40,
              color: AppColors.primaryColor,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
