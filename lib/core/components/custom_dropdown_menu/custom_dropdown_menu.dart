import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width,
    this.height,
  });

  final dynamic value;
  final double? width;
  final double? height;
  final List<DropdownMenuItem<Object>> items;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    final themeColors = context.read<ThemeCubit>().state.selectedColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: themeColors.cardBackground,
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
            style: context.textRobotoSmall.copyWith(color: themeColors.text),
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
