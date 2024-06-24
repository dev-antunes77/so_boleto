import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class OnboardingSection extends StatelessWidget {
  const OnboardingSection({
    super.key,
    required this.title,
    required this.text,
    required this.svg,
  });

  final String text;
  final String title;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceMassive,
      ),
      child: Column(
        children: [
          AppThemeValues.spaceVerticalMassive,
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textSubtitleHuge.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          AppThemeValues.spaceVerticalMassive,
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.textMedium,
          ),
          AppThemeValues.spaceVerticalImense,
          SvgAsset(
            svg: svg,
            height: context.height * 0.25,
          ),
        ],
      ),
    );
  }
}
