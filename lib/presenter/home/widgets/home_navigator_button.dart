import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class HomeNavigatorButton extends StatelessWidget {
  const HomeNavigatorButton({
    super.key,
    required this.isFuture,
    required this.onTap,
  });

  final bool isFuture;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppThemeValues.spaceSmall,
          vertical: AppThemeValues.spaceXXXSmall,
        ),
        child: Row(
          children: [
            if (isFuture)
              Text(
                'Contas\nFuturas',
                style: context.textSmall.copyWith(fontWeight: FontWeight.w500),
                textScaler: const TextScaler.linear(0.9),
                textAlign: TextAlign.center,
              ),
            Icon(
              isFuture
                  ? Icons.arrow_forward_ios_rounded
                  : Icons.arrow_back_ios_new_rounded,
            ),
            if (!isFuture)
              Text(
                'Contas\nAntigas',
                style: context.textSmall.copyWith(fontWeight: FontWeight.w500),
                textScaler: const TextScaler.linear(0.9),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
