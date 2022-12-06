import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';
import 'package:flutter_rick_and_morty_catalog/utils/icons.dart';
import 'package:flutter_rick_and_morty_catalog/views/character_home_page.dart';

class CharacterSplashPage extends StatefulWidget {
  const CharacterSplashPage({Key? key}) : super(key: key);

  @override
  State<CharacterSplashPage> createState() => _CharacterSplashPageState();
}

class _CharacterSplashPageState extends State<CharacterSplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CharacterHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.portalColor,
      body: Center(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Image.asset(AppIcons.portal, height: 300),
          ),
          Image.asset(AppIcons.rickAndMorty, height: 340),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
