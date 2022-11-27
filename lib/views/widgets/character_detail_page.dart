import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        return SingleChildScrollView(
          child: Column(
            children: const <Widget>[],
          ),
        );
      },
    ));
  }
}
