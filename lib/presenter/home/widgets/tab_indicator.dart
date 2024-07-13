import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class TabIndicator extends StatelessWidget {
  const TabIndicator(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppThemeValues.spaceXLarge,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          label,
          style: context.textSmall.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
