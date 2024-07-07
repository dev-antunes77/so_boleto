import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_dropdown_menu/custom_dropdown_menu.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';

class BillDueDayOfTheMonthSection extends StatelessWidget {
  const BillDueDayOfTheMonthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BillShell(
      child: BlocBuilder<BillCubit, BillState>(
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
                  AppLocalizations.current.billFlowDueDayTitle,
                  style: context.textRobotoMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              CustomDropdownMenu(
                value: state.bill.dueDay == 0 ? 1 : state.bill.dueDay,
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
                onChanged: (newValue) => context
                    .read<BillCubit>()
                    .onBillDueeDayOfTheMonthChange(newValue),
              ),
              const ExpandedSpace(),
              if (state.isEditionFlow)
                PillButton(
                  child: Text(AppLocalizations.current.done),
                  onTap: () => context.navigateTo(Routes.billCheck),
                )
              else
                BillSectionDoubleButtonRow(
                  onTap: () => context.pushTo(Routes.billCategory),
                ),
              AppThemeValues.spaceVerticalLarge,
            ],
          );
        },
      ),
    );
  }
}
