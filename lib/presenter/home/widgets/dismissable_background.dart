import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
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
      decoration:
          BoxDecoration(color: payDragging ? AppColors.primary : AppColors.red),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceLarge),
        child: Row(
          mainAxisAlignment:
              payDragging ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (payDragging) ...[
              Text('Pagando...', style: style),
              AppThemeValues.spaceHorizontalLarge,
              const SvgAsset(
                svg: AppIcons.money,
                height: 36,
                color: AppColors.background,
              ),
            ] else ...[
              const Align(
                alignment: Alignment.center,
                child: SvgAsset(
                  svg: AppIcons.delete,
                  height: 30,
                  color: AppColors.background,
                ),
              ),
              AppThemeValues.spaceHorizontalSmall,
              Text('Deletando...', style: style),
            ]
          ],
        ),
      ),
    );
  }
}
