import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class VerticalThinLineSeparator extends StatelessWidget {
  const VerticalThinLineSeparator({
    super.key,
    this.verticalPadding = AppThemeValues.spaceXSmall,
    this.horizontalPadding = AppThemeValues.spaceXSmall,
    this.height,
  });

  final double verticalPadding;
  final double horizontalPadding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child:
          Container(height: height ?? 50, color: AppColors.greyLight, width: 1),
    );
  }
}
