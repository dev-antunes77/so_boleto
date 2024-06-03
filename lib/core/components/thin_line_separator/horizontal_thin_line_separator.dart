import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({
    super.key,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.height,
    required this.width,
  });

  final double verticalPadding;
  final double horizontalPadding;
  final double height;
  final double width;

  factory LineSeparator.horizontal() => const LineSeparator(
        verticalPadding: AppThemeValues.spaceXSmall,
        horizontalPadding: AppThemeValues.spaceXSmall,
        height: 0.5,
        width: double.infinity,
      );

  factory LineSeparator.infiniteHorizon() => const LineSeparator(
        verticalPadding: AppThemeValues.spaceXSmall,
        horizontalPadding: 0.0,
        height: 0.5,
        width: double.infinity,
      );

  factory LineSeparator.vertical() => const LineSeparator(
        verticalPadding: AppThemeValues.spaceXSmall,
        horizontalPadding: AppThemeValues.spaceXSmall,
        height: double.infinity,
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
          height: 0.5,
          color: AppColors.grey.withOpacity(0.5),
          width: double.infinity),
    );
  }
}
