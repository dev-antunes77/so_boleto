import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.colors,
  });

  final String label;
  final ThemeColors colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colors.tag,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppThemeValues.spaceXXSmall,
            right: AppThemeValues.spaceXXSmall,
            top: AppThemeValues.spaceXTiny,
          ),
          child: Text(
            label,
            style: context.textXSmall.copyWith(
              color: colors.inversedText,
            ),
          ),
        ),
      ),
    );
  }
}
