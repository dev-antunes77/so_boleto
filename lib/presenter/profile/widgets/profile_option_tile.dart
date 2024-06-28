import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ProfileOptionTile extends StatelessWidget {
  const ProfileOptionTile({
    super.key,
    required this.label,
    required this.subtitle,
    required this.route,
  });

  final String label;
  final String subtitle;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceXXSmall,
      ),
      onTap: () => context.pushTo(route),
      title: Text(label, style: context.textRobotoSubtitleMedium),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
    );
  }
}
