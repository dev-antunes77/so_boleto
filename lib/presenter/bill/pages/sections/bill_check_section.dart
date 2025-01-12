import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_edit_tile.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class BillCheckSection extends StatefulWidget {
  const BillCheckSection({super.key});

  @override
  State<BillCheckSection> createState() => _BillCheckSectionState();
}

class _BillCheckSectionState extends State<BillCheckSection> {
  late bool isBillPayed;
  late final BillCubit cubit;

  @override
  void initState() {
    cubit = context.read<BillCubit>();
    isBillPayed = cubit.state.bill.isMonthPayed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = context.read<ThemeCubit>().state.selectedColors.tag;
    return BillShell(
      height: context.height * 0.83,
      child: Padding(
        padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
        child: BlocBuilder<BillCubit, BillState>(
          builder: (context, state) {
            return Column(
              children: [
                BillEditTile(
                  icon: AppIcons.description,
                  label: AppLocalizations.current.billFlowCheckName,
                  color: color,
                  value: state.bill.name.capitalize(),
                  width: double.infinity,
                  onTap: () => _pushToEditionFlow(context, Routes.billName),
                ),
                LineSeparator.infiniteHorizon(
                  verticalPadding: AppThemeValues.spaceXXXSmall,
                ),
                BillEditTile(
                  icon: AppIcons.description,
                  label: AppLocalizations.current.billFlowCheckDescription,
                  color: color,
                  value: state.bill.description.capitalize(),
                  onTap: () => _pushToEditionFlow(context, Routes.billName),
                ),
                LineSeparator.infiniteHorizon(
                  verticalPadding: AppThemeValues.spaceXXXSmall,
                ),
                BillEditTile(
                  icon: AppIcons.parcels,
                  color: color,
                  label: AppFormatters.parcelLabelFormatter(
                    state.bill.totalParcels,
                  ),
                  value: AppFormatters.parcelInfoFormatter(
                    state.bill.totalParcels,
                  ),
                  onTap: () => _pushToEditionFlow(context, Routes.billParcels),
                ),
                LineSeparator.infiniteHorizon(
                  verticalPadding: AppThemeValues.spaceXXXSmall,
                ),
                BillEditTile(
                  icon: AppIcons.calendar,
                  label: AppLocalizations.current.billFlowCheckDueDay,
                  color: color,
                  value: state.bill.dueDay.addLeadingZero(),
                  onTap: () => _pushToEditionFlow(context, Routes.billDueDay),
                ),
                LineSeparator.infiniteHorizon(
                  verticalPadding: AppThemeValues.spaceXXXSmall,
                ),
                BillEditTile(
                  icon: AppIcons.value,
                  label: AppLocalizations.current.billFlowCheckValue,
                  color: color,
                  value: state.bill.value.toDouble().formatCurrency(),
                  onTap: () => _pushToEditionFlow(context, Routes.billValue),
                ),
                LineSeparator.infiniteHorizon(
                  verticalPadding: AppThemeValues.spaceXXXSmall,
                ),
                BillEditTile(
                  icon: state.bill.category.getIconResponse,
                  label: AppLocalizations.current.billFlowCheckCategory,
                  color: color,
                  value: state.bill.category.getTextResponse,
                  onTap: () => _pushToEditionFlow(context, Routes.billCategory),
                ),
                LineSeparator.infiniteHorizon(
                  verticalPadding: AppThemeValues.spaceXXXSmall,
                ),
                AppThemeValues.spaceVerticalSmall,
                Row(
                  children: [
                    Text(
                      isBillPayed
                          ? AppLocalizations.current.billFlowRemoveFromPayed
                          : AppLocalizations.current.billFlowAddToPayed,
                      style: context.textRobotoSmall,
                    ),
                    AppThemeValues.spaceHorizontalSmall,
                    Switch(
                      value: isBillPayed,
                      onChanged: (value) => setState(() => isBillPayed = value),
                    ),
                  ],
                ),
                if (state.isEditionFlow)
                  PillButton.outlined(
                    onTap: () =>
                        context.pushTo(Routes.billHistory, params: state.bill),
                    color: color,
                    child: const Text(
                      'Acessar Histórico',
                    ),
                  ),
                const ExpandedSpace(),
                PillButton(
                  onTap: () => _onDone(context, state.isEditionFlow),
                  child: Text(AppLocalizations.current.done),
                ),
                AppThemeValues.spaceVerticalLarge,
              ],
            );
          },
        ),
      ),
    );
  }

  void _pushToEditionFlow(BuildContext context, String route) {
    context.navigateTo(route);
    context.read<BillCubit>().initiateEditionFlow();
  }

  void _onDone(BuildContext context, bool isEditionFlow) {
    final bill = cubit.onBillPayed(isBillPayed, isEditionFlow);
    isEditionFlow
        ? context.read<HomeBillsCubit>().editBill(bill)
        : context.read<HomeBillsCubit>().createBill(bill);
    context.navigateTo(Routes.home);
  }
}
