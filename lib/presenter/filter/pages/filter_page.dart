// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/presenter/filter/models/filter_pill.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FilterPill> pills = [];

  @override
  void initState() {
    pills = FilterPill.filterList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Column(
        children: [
          const Text('Selecione seus filtos'),
          const HorizontalThinLineSeparator(),
          const Text('Por categoria'),
          Wrap(
            children: pills
                .map(
                  (pill) => Padding(
                    padding: const EdgeInsets.all(
                      AppThemeValues.spaceXXXSmall,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: pill.isSelected
                            ? AppColors.primaryLight
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: pill.isSelected
                              ? Colors.transparent
                              : AppColors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppThemeValues.spaceXSmall,
                          vertical: AppThemeValues.spaceXXXSmall,
                        ),
                        child: GestureDetector(
                          onTap: () => setState(
                            () => pill.isSelected = !pill.isSelected,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                pill.isSelected
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                size: 16,
                                color:
                                    pill.isSelected ? AppColors.primary : null,
                              ),
                              AppThemeValues.spaceHorizontalTiny,
                              Text(
                                pill.category.enumToText(
                                  categoryMap,
                                ),
                                style: context.textRobotoXSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
