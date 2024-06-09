import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width,
    this.height,
    this.color,
  });

  final dynamic value;
  final double? width;
  final double? height;
  final Color? color;
  final List<DropdownMenuItem<Object>> items;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: color ?? AppColors.primary.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(
          AppThemeValues.spaceSmall,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppThemeValues.spaceSmall,
          vertical: AppThemeValues.spaceTiny,
        ),
        child: SizedBox(
          width: width ?? context.width * 0.15,
          height: height,
          child: DropdownButton(
            padding: EdgeInsets.zero,
            isExpanded: true,
            alignment: Alignment.centerLeft,
            style: context.textRobotoSmall,
            borderRadius: BorderRadius.circular(
              AppThemeValues.spaceSmall,
            ),
            underline: const SizedBox(),
            menuMaxHeight: context.height * 0.4,
            value: value,
            items: items,
            onChanged: (value) => onChanged(value!),
          ),
        ),
      ),
    );
  }
}
