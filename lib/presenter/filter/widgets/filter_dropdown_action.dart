import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_dropdown_menu/custom_dropdown_menu.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class FilterDropdownAction extends StatefulWidget {
  const FilterDropdownAction({
    super.key,
    required this.filterName,
    required this.switchValue,
    required this.dropdownValue,
    required this.dropdownListValues,
    required this.onDropdownSelected,
    required this.onSwitched,
    this.isPrice = false,
    this.isDueDay = false,
  });

  final String filterName;
  final bool switchValue;
  final bool isPrice;
  final bool isDueDay;
  final List<int> dropdownValue;
  final List<List<int>> dropdownListValues;
  final dynamic Function(dynamic) onDropdownSelected;
  final void Function(bool) onSwitched;

  @override
  State<FilterDropdownAction> createState() => _FilterDropdownActionState();
}

class _FilterDropdownActionState extends State<FilterDropdownAction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: SizedBox(
            height: 23,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  widget.filterName,
                  style: context.textRobotoSubtitleMedium,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Switch(
            value: widget.switchValue,
            onChanged: widget.onSwitched,
          ),
        ),
        AppThemeValues.spaceHorizontalSmall,
        Flexible(
          flex: 6,
          child: ExpandedSection(
            expand: widget.switchValue,
            child: CustomDropdownMenu(
              width: double.infinity,
              height: context.height * 0.04,
              value: widget.dropdownValue,
              items: widget.dropdownListValues
                  .map(
                    (e) => DropdownMenuItem<List<int>>(
                      value: e,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.isPrice
                              ? AppFormatters.priceRangeToString([e]).first
                              : widget.isDueDay
                                  ? AppFormatters.dueDayRangeToString([e]).first
                                  : AppFormatters.parcelRangeToString([e])
                                      .first,
                          style: widget.isPrice
                              ? context.textRobotoXSmall
                              : context.textRobotoSmall,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: widget.onDropdownSelected,
            ),
          ),
        ),
        AppThemeValues.spaceHorizontalXSmall,
      ],
    );
  }
}
