import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/buttons/svg_button.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ChoiceDialog extends StatelessWidget {
  const ChoiceDialog({
    super.key,
    this.width,
    required this.title,
    required this.description,
    required this.onAcept,
  });

  final String title;
  final String description;
  final double? width;
  final VoidCallback onAcept;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceMedium),
      child: Padding(
        padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: AppThemeValues.spaceMedium),
                    child: SvgButton(
                      svg: AppIcons.close,
                      onTap: context.pop,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(title, style: context.textSubtitleMedium),
                    AppThemeValues.spaceVerticalXLarge,
                    Text(description),
                    AppThemeValues.spaceVerticalLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PillButton(
                          backgroundColor: AppColors.primary,
                          onTap: context.pop,
                          child: const Text('não'),
                        ),
                        PillButton(
                          backgroundColor: AppColors.background,
                          onTap: onAcept,
                          child: Text(
                            'sim',
                            style: context.textRobotoMedium
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
