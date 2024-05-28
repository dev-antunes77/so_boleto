import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

void getCustomSnackBar(
  BuildContext context, {
  required String title,
  VoidCallback? action,
}) {
  final overlayEntry = _getOverlayEntry(title, action);

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3))
      .then((value) => overlayEntry.remove());
}

OverlayEntry _getOverlayEntry(
  String title,
  VoidCallback? action,
) =>
    OverlayEntry(
      builder: (context) => Positioned(
        bottom: AppThemeValues.spaceTitanic,
        left: AppThemeValues.spaceMedium,
        right: AppThemeValues.spaceMedium,
        child: GestureDetector(
          onTap: action,
          child: Material(
            elevation: 1,
            borderRadius:
                const BorderRadius.all(AppThemeValues.borderRadiusSmall),
            color: AppColors.primary,
            child: Container(
              padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
              height: AppThemeValues.playerHeight,
              child: Center(
                child: Text(
                  title,
                  style: context.textRobotoMedium
                      .copyWith(color: AppColors.textLighter),
                ),
              ),
            ),
          ),
        ),
      ),
    );
