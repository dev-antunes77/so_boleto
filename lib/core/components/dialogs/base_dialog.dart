import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/buttons/svg_button.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.title,
    required this.description,
    this.onAcept,
    this.onDeny,
    this.onConfirmText,
    this.onDenyText,
  });

  final String title;
  final String description;
  final VoidCallback? onAcept;
  final VoidCallback? onDeny;
  final String? onConfirmText;
  final String? onDenyText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceHuge),
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
                      onTap: () => context.pop(true),
                    ),
                  ),
                ),
                Column(
                  children: [
                    AppThemeValues.spaceVerticalLarge,
                    Text(title, style: context.textSubtitleMedium),
                    if (description.isNotEmpty) ...[
                      AppThemeValues.spaceVerticalXLarge,
                      Text(
                        description,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    AppThemeValues.spaceVerticalXLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PillButton(
                          backgroundColor: AppColors.primary,
                          onTap: () => context.pop(true),
                          child: Text(onDenyText ?? 'Não'),
                        ),
                        PillButton(
                          backgroundColor: AppColors.background,
                          onTap: onAcept,
                          child: Text(
                            onConfirmText ?? 'Sim',
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
