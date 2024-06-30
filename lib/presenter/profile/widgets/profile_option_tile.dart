import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ProfileOptionTile extends StatelessWidget {
  const ProfileOptionTile({
    super.key,
    required this.label,
    required this.svg,
    this.subtitle,
    required this.onTap,
    required this.color,
  });

  final String label;
  final String svg;
  final String? subtitle;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceXXSmall,
      ),
      onTap: onTap,
      leading: SvgAsset(
        svg: svg,
        height: 28,
        color: color,
      ),
      title: Text(label, style: context.textRobotoSubtitleMedium),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
    );
  }
}
