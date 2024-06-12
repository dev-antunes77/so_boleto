import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:so_boleto/core/components/custom_dropdown_menu/custom_dropdown_menu.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/helpers/currency_ptbr_input_formatter.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';

class PromptBillEditionTile extends StatelessWidget {
  const PromptBillEditionTile({
    super.key,
    required this.promptBill,
    required this.onValueChanged,
    required this.onDueDayChanged,
    required this.dueDayValue,
    required this.valueFocus,
    this.onEditingComplete,
    required this.isLastItem,
  });

  final PromptBill promptBill;
  final int dueDayValue;
  final bool isLastItem;
  final Function(String) onValueChanged;
  final Function(dynamic) onDueDayChanged;
  final FocusNode valueFocus;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: SizedBox(
            width: context.width * 0.2,
            child: Column(
              children: [
                SvgAsset(
                  svg: promptBill.category.value,
                  height: 32,
                  color: promptBill.value > 0
                      ? AppColors.primaryDark
                      : AppColors.greyMediumLight,
                ),
                AppThemeValues.spaceVerticalTiny,
                Text(
                  promptBill.name,
                  style: context.textRobotoSubtitleSmall.copyWith(
                    color: promptBill.value > 0
                        ? AppColors.primaryDark
                        : AppColors.greyMediumLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        AppThemeValues.spaceHorizontalMedium,
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.current.prompBillEditionTileDueDay,
                style: context.textRobotoXSmall,
              ),
              CustomDropdownMenu(
                height: 30,
                value: dueDayValue,
                color: AppColors.grey,
                items: AppConstants.monthDays
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text(
                          e.addLeadingZero(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (dueDay) => onDueDayChanged(dueDay),
              ),
            ],
          ),
        ),
        LineSeparator.vertical(height: AppThemeValues.spaceEnormous),
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.current.prompBillEditionTileValue,
                style: context.textRobotoXSmall,
              ),
              SizedBox(
                height: 36,
                child: TextField(
                  style: context.textSmall,
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                  ),
                  textInputAction:
                      isLastItem ? TextInputAction.done : TextInputAction.next,
                  onEditingComplete: onEditingComplete,
                  focusNode: valueFocus,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyPtBrInputFormatter(),
                  ],
                  onChanged: onValueChanged,
                  scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom +
                        (isLastItem
                            ? context.height * 0.2
                            : context.height * 0.1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
