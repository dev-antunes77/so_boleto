import 'package:flutter/material.dart';

abstract class AppColors {
  static const text = black;
  static const textLight = grey;
  static const textLighter = greyLight;
  static const background = white;
  static const backgroundDark = overlay;

  static const primary = Color(0xFFFF1493);
  static const primaryLight = Color.fromARGB(255, 254, 149, 205);
  static const error = Color.fromARGB(255, 145, 22, 13);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1F1D1D);
  static const overlay = Color(0x99222222);
  static const shadow = Color(0x25000000);
  static const transparent = Color(0x00000000);

  static const grey = Color(0xFF525252);
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
