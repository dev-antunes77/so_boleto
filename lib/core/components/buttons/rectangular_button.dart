import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.label,
    required this.isValid,
    required this.onTap,
    this.isInversed = false,
    this.horizontalPadding = AppThemeValues.spaceSmall,
  });

  factory RectangularButton.inverse({
    required String label,
    required bool isValid,
    required VoidCallback onTap,
  }) =>
      RectangularButton(
        isInversed: true,
        label: label,
        isValid: isValid,
        onTap: onTap,
      );

  final String label;
  final bool isValid;
  final bool isInversed;
  final double horizontalPadding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;

    final Color validButtonColor =
        isInversed ? Colors.transparent : theme.selectedColors.primary;

    final Color invalidButtonColor =
        isInversed ? Colors.transparent : theme.selectedColors.disabled;

    final Color validButtonTextColor =
        isInversed ? theme.selectedColors.text : Colors.white;

    final Color invalidButtonTextColor =
        isInversed ? Colors.grey : Colors.white;

    return InkWell(
      onTap: isValid ? onTap : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Card(
          shadowColor: isInversed ? Colors.transparent : null,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.horizontal(),
            side: isInversed
                ? BorderSide(
                    color:
                        isValid ? theme.selectedColors.primary : AppColors.grey,
                    width: 2)
                : BorderSide.none,
          ),
          color: isValid ? validButtonColor : invalidButtonColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: context.textRobotoSubtitleSmall.copyWith(
                  color:
                      isValid ? validButtonTextColor : invalidButtonTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
