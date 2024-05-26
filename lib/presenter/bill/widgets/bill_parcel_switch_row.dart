import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillParcelSwitchRow extends StatelessWidget {
  const BillParcelSwitchRow({
    super.key,
    this.onChanged,
    required this.choice,
    required this.label,
  });

  final bool choice;
  final String label;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textRobotoSubtitleMedium,
          ),
          AppThemeValues.spaceHorizontalLarge,
          Switch(
            value: choice,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
