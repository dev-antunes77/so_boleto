import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/buttons/svg_button.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.description,
    this.content,
    this.onAcept,
    this.onDeny,
    this.onConfirmText,
    this.onDenyText,
  }) : assert(content != null || (title != null && description != null));

  final String? title;
  final String? description;
  final Widget? content;
  final VoidCallback? onAcept;
  final VoidCallback? onDeny;
  final String? onConfirmText;
  final String? onDenyText;

  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeCubit>().state.selectedColors;
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
                content ??
                    Column(
                      children: [
                        AppThemeValues.spaceVerticalLarge,
                        if (title != null)
                          Text(title!, style: context.textSubtitleMedium),
                        if (description != null) ...[
                          AppThemeValues.spaceVerticalXLarge,
                          Text(
                            description!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                        AppThemeValues.spaceVerticalXLarge,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PillButton(
                              backgroundColor: color.tag,
                              onTap: () => context.pop(true),
                              child: Text(
                                onDenyText ?? AppLocalizations.current.no,
                              ),
                            ),
                            PillButton(
                              backgroundColor: AppColors.white.withOpacity(0.5),
                              onTap: onAcept,
                              child: Text(
                                onConfirmText ?? AppLocalizations.current.yes,
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
