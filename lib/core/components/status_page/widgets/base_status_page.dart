import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/buttons/svg_button.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BaseStatusPage extends StatelessWidget {
  const BaseStatusPage({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback? onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: AppThemeValues.spaceImense + AppThemeValues.spaceXXSmall,
              ),
              child: SvgAsset(svg: AppIcons.money),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgButton(
                    svg: icon,
                    color: AppColors.textLight,
                    height: 48,
                    width: 48,
                  ),
                  AppThemeValues.spaceVerticalMedium,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textSubtitleSmall,
                  ),
                  AppThemeValues.spaceVerticalMedium,
                  PillButton(
                    backgroundColor: AppColors.primary,
                    onTap: onTap ?? () => context.pop,
                    child: Text(AppLocalizations.current.tryAgain),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
