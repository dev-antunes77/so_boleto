import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillEditTile extends StatelessWidget {
  const BillEditTile({
    super.key,
    required this.label,
    required this.value,
    required this.onPressed,
    this.width,
  });

  final String label;
  final String value;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppThemeValues.spaceXLarge),
      child: SizedBox(
        width: width ?? context.width * 0.35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textSmall),
                Text(value, style: context.textRobotoSubtitleMedium),
              ],
            ),
            CircleAvatar(
              child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.mode_edit_outline_outlined,
                    color: AppColors.primary,
                    size: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
