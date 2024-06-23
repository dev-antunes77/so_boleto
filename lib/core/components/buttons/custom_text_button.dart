import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disable = false,
    this.padding,
    this.fontSize,
  });

  final String label;
  final VoidCallback onPressed;
  final bool disable;
  final EdgeInsets? padding;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppThemeValues.spaceSmall),
      onTap: disable ? null : onPressed,
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: AppThemeValues.spaceLarge,
              vertical: AppThemeValues.spaceSmall,
            ),
        child: Text(
          label,
          style: context.textRobotoSmall.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: disable
                ? AppColors.primary.withOpacity(0.4)
                : AppColors.primary,
          ),
        ),
      ),
    );
  }
}