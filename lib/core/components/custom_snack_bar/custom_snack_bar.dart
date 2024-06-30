import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/theme/settings/theme_colors.dart';

void getCustomSnackBar(
  BuildContext context, {
  required String title,
  VoidCallback? action,
}) {
  final color = context.read<ThemeCubit>().state.selectedColors;
  final overlayEntry = _getOverlayEntry(title, color, action);

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(const Duration(milliseconds: 4300))
      .then((value) => overlayEntry.remove());
}

OverlayEntry _getOverlayEntry(
  String title,
  ThemeColors color,
  VoidCallback? action,
) =>
    OverlayEntry(
      builder: (context) => Positioned(
        bottom: AppThemeValues.spaceColossal,
        left: AppThemeValues.spaceMedium,
        right: AppThemeValues.spaceMedium,
        child: GestureDetector(
          onTap: action,
          child: Material(
            elevation: 1,
            borderRadius:
                const BorderRadius.all(AppThemeValues.borderRadiusSmall),
            color: color.error,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppThemeValues.spaceMedium,
              ),
              child: Text(
                title,
                style: context.textRobotoMedium.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
