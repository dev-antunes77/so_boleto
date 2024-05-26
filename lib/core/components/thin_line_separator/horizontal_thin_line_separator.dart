import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class HorizontalThinLineSeparator extends StatelessWidget {
  const HorizontalThinLineSeparator({
    super.key,
    this.verticalPadding = AppThemeValues.spaceXSmall,
    this.horizontalPadding = AppThemeValues.spaceXSmall,
  });

  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Container(
          height: 1, color: AppColors.greyLight, width: double.infinity),
    );
  }
}
