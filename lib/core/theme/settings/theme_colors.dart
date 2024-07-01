import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:so_boleto/core/extensions/color_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class ThemeColors {
  ThemeColors({
    required this.baseColor,
    required this.primary,
    required this.cardBackground,
    required this.circleBackground,
    required this.text,
    required this.inversedText,
    required this.icon,
    required this.tag,
    required this.disabled,
    required this.error,
  });

  factory ThemeColors.dark(Color color) {
    final primary = color.makeColorDarker();
    return ThemeColors(
      baseColor: color,
      primary: primary,
      cardBackground: color.makeColorDarker(opacityFactor: 0.07),
      circleBackground: color.makeColorDarker(opacityFactor: 0.15),
      tag: color.makeColorDarker(opacityFactor: 0.6),
      text: _mixColors(primary, AppColors.white, 0.9),
      inversedText: _mixColors(primary, AppColors.black, 0.9),
      icon: _mixColors(primary, AppColors.white, 0.5),
      disabled: AppColors.darkGrey,
      error: _mixColors(AppColors.error, Colors.black, 0.3),
    );
  }
  static Color _mixColors(Color color1, Color color2, double ratio) {
    assert(ratio >= 0 && ratio <= 1);
    int r = (color1.red + (color2.red - color1.red) * ratio).round();
    int g = (color1.green + (color2.green - color1.green) * ratio).round();
    int b = (color1.blue + (color2.blue - color1.blue) * ratio).round();
    return Color.fromRGBO(r, g, b, 1.0);
  }

  factory ThemeColors.light(Color color) => ThemeColors(
        baseColor: color,
        primary: color,
        cardBackground: color.withOpacity(0.15),
        circleBackground: color.withOpacity(0.5),
        tag: color.withOpacity(0.8),
        text: _mixColors(color, Colors.black, 0.9),
        inversedText: _mixColors(color, Colors.white, 0.9),
        icon: _mixColors(color, Colors.black, 0.6),
        disabled: Colors.grey,
        error: _mixColors(AppColors.error, Colors.black, 0.3),
      );

  Map<String, dynamic> toJson() {
    return {
      'baseColor': baseColor.colorToJson(),
      'primary': primary.colorToJson(),
      'cardBackground': cardBackground.colorToJson(),
      'circleBackground': circleBackground.colorToJson(),
      'text': text.colorToJson(),
      'inversedText': inversedText.colorToJson(),
      'icon': icon.colorToJson(),
      'tag': tag.colorToJson(),
      'disabled': disabled.colorToJson(),
      'error': error.colorToJson(),
    };
  }

  factory ThemeColors.fromJson(Map<String, dynamic> json) {
    return ThemeColors(
      baseColor: _parseColor(json['baseColor']),
      primary: _parseColor(json['primary']),
      cardBackground: _parseColor(json['cardBackground']),
      circleBackground: _parseColor(json['circleBackground']),
      text: _parseColor(json['text']),
      inversedText: _parseColor(json['inversedText']),
      icon: _parseColor(json['icon']),
      tag: _parseColor(json['tag']),
      disabled: _parseColor(json['disabled']),
      error: _parseColor(json['error']),
    );
  }

  static Color _parseColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    int value = int.parse(hexColor, radix: 16);
    return Color(value);
  }

  factory ThemeColors.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return ThemeColors(
      baseColor: data?['baseColor'],
      primary: data?['primary'],
      cardBackground: data?['cardBackground'],
      circleBackground: data?['circleBackground'],
      icon: data?['icon'],
      text: data?['text'],
      tag: data?['tag'],
      inversedText: data?['inversedText'],
      disabled: data?['disabled'],
      error: data?['error'],
    );
  }

  final Color baseColor;
  final Color primary;
  final Color cardBackground;
  final Color circleBackground;
  final Color tag;
  final Color icon;
  final Color text;
  final Color inversedText;
  final Color disabled;
  final Color error;

  ThemeColors copyWith({
    Color? baseColor,
    Color? primary,
    Color? cardBackground,
    Color? circleBackground,
    Color? text,
    Color? inversedText,
    Color? icon,
    Color? tag,
    Color? disabled,
    Color? error,
  }) {
    return ThemeColors(
      baseColor: baseColor ?? this.baseColor,
      primary: primary ?? this.primary,
      cardBackground: cardBackground ?? this.cardBackground,
      circleBackground: circleBackground ?? this.circleBackground,
      text: text ?? this.text,
      inversedText: inversedText ?? this.inversedText,
      icon: icon ?? this.icon,
      tag: tag ?? this.tag,
      disabled: disabled ?? this.disabled,
      error: error ?? this.error,
    );
  }
}
