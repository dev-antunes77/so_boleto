// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    super.key,
    this.onTap,
    required this.svg,
    this.height,
    this.width,
    this.color,
  });
  final VoidCallback? onTap;
  final String svg;

  /// Uses the default value AppThemeValues.defaultIconSize.height
  final double? height;

  /// Uses the default value AppThemeValues.defaultIconSize.width
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgAsset(
        svg: svg,
        width: width ?? AppThemeValues.defaultIconSize.width,
        height: height ?? AppThemeValues.defaultIconSize.height,
        color: color,
      ),
    );
  }
}
