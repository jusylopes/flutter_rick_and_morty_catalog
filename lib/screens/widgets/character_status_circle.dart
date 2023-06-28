import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_catalog/utils/colors.dart';

class CharacterStatusCircle extends StatelessWidget {
  const CharacterStatusCircle({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorStatus(status),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorStatus(status),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
    );
  }
}
