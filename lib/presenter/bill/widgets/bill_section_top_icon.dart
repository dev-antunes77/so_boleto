import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillSectionTopIcon extends StatelessWidget {
  const BillSectionTopIcon(this.icon, {super.key});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppThemeValues.spaceMassive, bottom: AppThemeValues.spaceXLarge),
      child: SvgAsset(
        svg: icon,
        height: 70,
      ),
    );
  }
}
