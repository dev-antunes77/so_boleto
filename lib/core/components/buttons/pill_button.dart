import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.size,
    this.fillWidth = false,
    this.outlinedButton = false,
    this.isDisabled = false,
  });

  final VoidCallback? onTap;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final bool fillWidth;
  final bool outlinedButton;
  final Size? size;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final minimunSize = size ??
        (fillWidth
            ? const Size.fromHeight(AppThemeValues.spaceMassive)
            : const Size(
                AppThemeValues.spaceTitanic,
                AppThemeValues.spaceMassive,
              ));

    final ButtonStyle buttonStyle = ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeValues.spaceHuge)),
      ),
      side: WidgetStateProperty.all(
        outlinedButton
            ? BorderSide(
                color: borderColor ?? AppColors.background,
              )
            : BorderSide.none,
      ),
      minimumSize: WidgetStateProperty.all<Size>(minimunSize),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled) || isDisabled) {
            return Colors.grey;
          }
          return backgroundColor ??
              context.read<ThemeCubit>().state.selectedColor;
        },
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        foregroundColor ?? AppColors.background,
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(context.textSubtitleSmall),
    );

    return outlinedButton
        ? OutlinedButton(
            onPressed: isDisabled ? () {} : onTap,
            style: buttonStyle,
            child: child,
          )
        : ElevatedButton(
            onPressed: isDisabled ? () {} : onTap,
            style: buttonStyle,
            child: child,
          );
  }
}
