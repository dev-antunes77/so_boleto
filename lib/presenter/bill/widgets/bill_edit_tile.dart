import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillEditTile extends StatelessWidget {
  const BillEditTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onPressed,
    this.width,
  });

  final String icon;
  final String label;
  final String value;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppThemeValues.spaceTiny),
      child: Row(
        children: [
          SvgAsset(
            svg: icon,
            height: 32,
            color: AppColors.primary,
          ),
          AppThemeValues.spaceHorizontalXLarge,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: context.textSmall),
              GestureDetector(
                  onTap: onPressed,
                  child: Row(
                    children: [
                      Text(value, style: context.textMedium),
                      AppThemeValues.spaceHorizontalTiny,
                      const Icon(Icons.edit_outlined, size: 16)
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
