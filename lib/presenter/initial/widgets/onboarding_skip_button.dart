import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
    required this.onSkip,
  });

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppThemeValues.spaceSmall),
        onTap: onSkip,
        child: Padding(
          padding: const EdgeInsets.only(
            right: AppThemeValues.spaceMedium,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pular',
                style: context.textRobotoSubtitleSmall
                    .copyWith(color: AppColors.primary),
              ),
              AppThemeValues.spaceHorizontalXTiny,
              const Icon(
                Icons.fast_forward_outlined,
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
