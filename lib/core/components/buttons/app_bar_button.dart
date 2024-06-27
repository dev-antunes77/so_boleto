import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppThemeValues.spaceSmall,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppThemeValues.spaceSmall,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppThemeValues.spaceSmall,
              vertical: AppThemeValues.spaceTiny,
            ),
            child: Text(
              label,
              style: context.textSmall.copyWith(),
            ),
          ),
        ),
      ),
    );
  }
}
