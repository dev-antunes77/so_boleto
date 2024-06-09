import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class DismissableBackGround extends StatelessWidget {
  const DismissableBackGround({
    super.key,
    this.payDragging = false,
  });

  final bool payDragging;

  @override
  Widget build(BuildContext context) {
    final style =
        context.textSubtitleLarge.copyWith(color: AppColors.background);
    return DecoratedBox(
      decoration: BoxDecoration(
          color: payDragging ? AppColors.primary : AppColors.darkRed),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceLarge),
        child: Row(
          mainAxisAlignment:
              payDragging ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (payDragging) ...[
              Text(AppLocalizations.current.homeBillPaying, style: style),
              AppThemeValues.spaceHorizontalLarge,
              const SvgAsset(
                svg: AppIcons.money,
                height: 46,
                color: AppColors.background,
              ),
            ] else ...[
              Text(AppLocalizations.current.homeBillDeleting, style: style),
              AppThemeValues.spaceHorizontalSmall,
              const SvgAsset(
                svg: AppIcons.delete,
                height: 30,
                color: AppColors.background,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
