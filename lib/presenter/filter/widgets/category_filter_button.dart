import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/filter/models/filter_pill.dart';

class CategoryFilterButton extends StatelessWidget {
  const CategoryFilterButton({
    super.key,
    required this.pill,
    required this.onTap,
  });

  final FilterPill pill;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceTiny,
        vertical: AppThemeValues.spaceXXXSmall,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: pill.isSelected ? AppColors.primaryLight : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: pill.isSelected
                ? AppColors.primary.withOpacity(0.5)
                : AppColors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeValues.spaceXSmall,
            vertical: AppThemeValues.spaceXXXSmall,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  pill.isSelected
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                  size: 16,
                  color: pill.isSelected ? AppColors.primary : null,
                ),
                AppThemeValues.spaceHorizontalTiny,
                Text(
                  pill.category.value['text'],
                  style: context.textRobotoXSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
