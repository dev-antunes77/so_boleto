import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_dropdown_menu.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';

class BillDueDayOfTheMonthSection extends StatelessWidget {
  const BillDueDayOfTheMonthSection({super.key});

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
                bottom: AppThemeValues.spaceMedium,
              ),
              child: Text(
                'Dia do vencimento',
                style: context.textRobotoMedium,
                textAlign: TextAlign.center,
              ),
            ),
            BillDropdownMenu(
              list: AppConstants.monthDays,
              dueDayOfTheMonth: state.bill.dueDayOfTheMonth,
              onChanged: (newValue) => context
                  .read<BillCubit>()
                  .onBillDueeDayOfTheMonthChange(newValue),
            ),
            const Expanded(child: AppThemeValues.spaceVerticalHuge),
            const BillSectionButtonRow(Routes.billCategory),
            AppThemeValues.spaceVerticalLarge,
          ],
        );
      },
    );
  }
}
