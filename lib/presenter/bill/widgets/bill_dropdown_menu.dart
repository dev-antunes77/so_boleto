import 'package:flutter/material.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillDropdownMenu extends StatelessWidget {
  const BillDropdownMenu({
    super.key,
    required this.dueDayOfTheMonth,
    required this.list,
    required this.onChanged,
  });

  final int dueDayOfTheMonth;
  final List<int> list;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border:
              Border.all(width: 1.5, color: AppColors.primary.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppThemeValues.spaceSmall,
          vertical: AppThemeValues.spaceTiny,
        ),
        child: SizedBox(
          width: context.width * 0.15,
          child: Center(
            child: DropdownButton(
              underline: const SizedBox(),
              menuMaxHeight: context.height * 0.4,
              value: dueDayOfTheMonth,
              items: list
                  .map(
                    (e) => DropdownMenuItem(
                        value: e, child: Text(e.addLeadingZero())),
                  )
                  .toList(),
              onChanged: (value) => onChanged(value!),
            ),
          ),
        ),
      ),
    );
  }
}
