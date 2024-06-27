import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ProfileTitleSection extends StatelessWidget {
  const ProfileTitleSection(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceTiny,
        vertical: AppThemeValues.spaceMedium,
      ),
      child: Text(
        title,
        style: context.textRobotoSubtitleMediumToLarge,
      ),
    );
  }
}
