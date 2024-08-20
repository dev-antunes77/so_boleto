import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class FutureBillInfoRow extends StatelessWidget {
  const FutureBillInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppThemeValues.spaceXTiny,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: context.textRobotoXSmall,
          ),
          Text(
            value,
            style: context.textRobotoSubtitleSmall,
            textScaler: const TextScaler.linear(1.1),
          ),
        ],
      ),
    );
  }
}
