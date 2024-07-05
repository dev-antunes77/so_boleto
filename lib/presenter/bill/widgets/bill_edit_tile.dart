import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillEditTile extends StatelessWidget {
  const BillEditTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onPressed,
    this.width,
    required this.color,
  });

  final String icon;
  final String label;
  final String value;
  final Color color;
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
            color: color,
          ),
          AppThemeValues.spaceHorizontalXLarge,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: context.textRobotoSubtitleSmall),
              GestureDetector(
                onTap: onPressed,
                child: Row(
                  children: [
                    Text(value.breakLongStrings(),
                        style: context.textRobotoMedium),
                    AppThemeValues.spaceHorizontalTiny,
                    const Icon(Icons.edit_outlined, size: 16)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
