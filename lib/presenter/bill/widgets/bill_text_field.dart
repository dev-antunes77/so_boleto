import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillTextField extends StatelessWidget {
  const BillTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.hitText,
    this.icon,
    this.textInputType,
    this.width,
    this.textAlign,
    this.hasBorder = true,
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final String hitText;
  final String? icon;
  final TextInputType? textInputType;
  final double? width;
  final TextAlign? textAlign;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppThemeValues.spaceMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width ?? context.width * 0.6,
              child: TextField(
                keyboardType: textInputType ?? TextInputType.text,
                textAlign: textAlign ?? TextAlign.center,
                style: context.textRobotoSubtitleSmall,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: hitText,
                  enabledBorder: hasBorder
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        )
                      : InputBorder.none,
                  focusedBorder: hasBorder
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        )
                      : InputBorder.none,
                ),
                controller: controller,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
