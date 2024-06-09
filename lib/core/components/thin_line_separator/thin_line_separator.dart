import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class LineSeparator extends StatelessWidget {
  LineSeparator({
    super.key,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.height,
    required this.width,
    Color? color,
  }) : color = color ?? AppColors.grey.withOpacity(0.5);

  final double verticalPadding;
  final double horizontalPadding;
  final double height;
  final double width;
  final Color color;

  factory LineSeparator.horizontal() => LineSeparator(
        verticalPadding: AppThemeValues.spaceXSmall,
        horizontalPadding: AppThemeValues.spaceXSmall,
        height: 0.5,
        width: double.infinity,
      );

  factory LineSeparator.horizontalLimited(
    double width, {
    bool noPadding = false,
  }) =>
      LineSeparator(
        verticalPadding: noPadding ? 0.0 : AppThemeValues.spaceXSmall,
        horizontalPadding: noPadding ? 0.0 : AppThemeValues.spaceXSmall,
        height: 0.5,
        width: width,
      );

  factory LineSeparator.horizontalLimitedThick({
    required double width,
    required double height,
    bool noPadding = false,
    Color? color,
  }) =>
      LineSeparator(
        verticalPadding: noPadding ? 0.0 : AppThemeValues.spaceXSmall,
        horizontalPadding: noPadding ? 0.0 : AppThemeValues.spaceXSmall,
        height: height,
        width: width,
        color: color,
      );

  factory LineSeparator.infiniteHorizon() => LineSeparator(
        verticalPadding: AppThemeValues.spaceXSmall,
        horizontalPadding: 0.0,
        height: 0.5,
        width: double.infinity,
      );

  factory LineSeparator.vertical({required double height}) => LineSeparator(
        verticalPadding: AppThemeValues.spaceXSmall,
        horizontalPadding: AppThemeValues.spaceXSmall,
        height: height,
        width: 0.5,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Container(
        height: height,
        color: color,
        width: width,
      ),
    );
  }
}
