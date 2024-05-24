import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class RoundedBottomSheet extends StatelessWidget {
  const RoundedBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.denyText,
    required this.confirmText,
    required this.onConfirm,
  });

  final String title;
  final String description;
  final String denyText;
  final String confirmText;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeValues.spaceXLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTitleSmall.copyWith(color: AppColors.primary),
          ),
          AppThemeValues.spaceVerticalLarge,
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.textLarge,
          ),
          AppThemeValues.spaceVerticalLarge,
          Row(
            children: [
              Expanded(
                child: PillButton(
                  backgroundColor: AppColors.background,
                  foregroundColor: AppColors.black,
                  borderColor: AppColors.black,
                  outlinedButton: true,
                  onTap: context.pop,
                  child: Text(denyText),
                ),
              ),
              AppThemeValues.spaceHorizontalSmall,
              Expanded(
                child: PillButton(
                  onTap: onConfirm,
                  child: Text(confirmText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
