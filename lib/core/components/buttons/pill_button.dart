import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

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
    final minimunSize =
        size ?? (fillWidth ? const Size.fromHeight(48) : const Size(107, 48));

    final ButtonStyle buttonStyle = ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return backgroundColor ?? AppColors.primary;
        },
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        foregroundColor ?? AppColors.background,
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(context.textSubtitleSmall),
    );

    return outlinedButton
        ? OutlinedButton(
            onPressed: onTap,
            style: buttonStyle,
            child: child,
          )
        : ElevatedButton(
            onPressed: onTap,
            style: buttonStyle,
            child: child,
          );
  }
}
