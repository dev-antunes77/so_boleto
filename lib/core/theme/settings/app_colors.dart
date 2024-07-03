import 'package:flutter/material.dart';

abstract class AppColors {
  static const text = black;
  static const textLight = grey;
  static const textLighter = greyLight;
  static const background = white;

  static const primary = Color.fromARGB(254, 5, 136, 59);
  // static const primary = Color.fromARGB(255, 4, 135, 58);
  static const primaryDark = Color.fromARGB(166, 19, 45, 8);
  static const primaryLight = Color.fromARGB(255, 149, 254, 209);
  static const primaryBackground = Color.fromARGB(255, 233, 244, 235);

  static const error = Color.fromARGB(255, 245, 112, 103);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1F1D1D);
  static const overlay = Color(0x99222222);
  static const shadow = Color(0x25000000);
  static const transparent = Color(0x00000000);

  static const grey = Color(0xFF525252);
  static const darkGrey = Color.fromARGB(255, 41, 41, 41);
  static const greyMediumLight = Color.fromARGB(255, 166, 166, 166);
  static const greyLight = Color.fromARGB(255, 224, 230, 242);

  static const orange = Color(0xFFF7691E);
  static const darkOrange = Color(0xFFB84D01);

  static const red = Color(0xFFDA291C);
  static const darkRed = Color(0xFFB80101);

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );
}
