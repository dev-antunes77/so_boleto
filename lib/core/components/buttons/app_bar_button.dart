import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppThemeValues.spaceXXSmall,
            right: AppThemeValues.spaceXXSmall,
            top: AppThemeValues.spaceXTiny,
          ),
          child: Text(
            label,
            style: context.textXSmall,
          ),
        ),
      ),
    );
  }
}
