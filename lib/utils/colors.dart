import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff202329);
  static const Color secondaryColor = Color(0xff3c3e44);
  static const Color portalColor = Color(0xff202329);
  static const Color aliveColor = Color(0xff617734);
  static const Color deadColor = Color(0xffe85356);
  static const Color cColor = Color(0xfffff874);

  static colorStatus(String status) {
    return status == 'Alive'
        ? AppColors.aliveColor
        : status == 'Dead'
            ? AppColors.deadColor
            : Colors.grey;
  }
}
