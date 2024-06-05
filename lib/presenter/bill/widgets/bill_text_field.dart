import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillTextField extends StatelessWidget {
  const BillTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    required this.hitText,
    this.icon,
    this.textInputType,
    this.textInputAction,
    this.width,
    this.helperText,
    this.textAlign,
    this.formatters,
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final String hitText;
  final String? helperText;
  final String? icon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final double? width;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppThemeValues.spaceLarge),
      child: SizedBox(
        width: width ?? context.width * 0.6,
        child: TextField(
          keyboardType: textInputType ?? TextInputType.name,
          textAlign: textAlign ?? TextAlign.center,
          style: context.textRobotoSubtitleSmall,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: hitText,
            helper: helperText == null
                ? const SizedBox.shrink()
                : Center(
                    child: Text(
                      helperText!,
                      style: context.textRobotoSubtitleXSmall,
                    ),
                  ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryLight),
            ),
          ),
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          onTapOutside: onTapOutside,
          inputFormatters: formatters,
          controller: controller,
        ),
      ),
    );
  }
}
