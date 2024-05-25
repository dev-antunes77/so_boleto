import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillDueDayOfTheMonthSection extends StatelessWidget {
  const BillDueDayOfTheMonthSection(this.navigateSection, {super.key});

  final Function(bool) navigateSection;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillCubit, BillState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            const BillSectionTopIcon(AppIcons.calendar),
            Padding(
              padding: const EdgeInsets.only(
                top: AppThemeValues.spaceLarge,
                bottom: AppThemeValues.spaceMedium,
              ),
              child: Text(
                'Dia do vencimento',
                style: context.textRobotoMedium,
                textAlign: TextAlign.center,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5, color: AppColors.primary.withOpacity(0.7)),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppThemeValues.spaceSmall,
                  vertical: AppThemeValues.spaceTiny,
                ),
                child: SizedBox(
                  width: context.width * 0.13,
                  child: Center(
                    child: DropdownButton(
                      underline: const SizedBox(),
                      menuMaxHeight: context.height * 0.4,
                      value: state.newBill.dueDayOfTheMonth,
                      items: AppConstants.monthDays
                          .map(
                            (e) => DropdownMenuItem(
                                value: e, child: Text(e.addLeadingZero())),
                          )
                          .toList(),
                      onChanged: (newValue) => context
                          .read<BillCubit>()
                          .onBillDueeDayOfTheMonthChange(newValue!),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: AppThemeValues.spaceVerticalHuge),
            BillSectionButtonRow(navigateSection: navigateSection),
          ],
        );
      },
    );
  }
}
