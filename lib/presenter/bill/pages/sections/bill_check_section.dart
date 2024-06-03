import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_edit_tile.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class BillCheckSection extends StatelessWidget {
  const BillCheckSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BillShell(
      height: context.height * 0.75,
      child: Padding(
        padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
        child: BlocBuilder<BillCubit, BillState>(
          builder: (context, state) {
            return Column(
              children: [
                BillEditTile(
                  icon: AppIcons.description,
                  label: 'Nome:',
                  value: state.bill.name.capitalize(),
                  width: double.infinity,
                  onPressed: () => _pushToEditionFlow(context, Routes.billName),
                ),
                LineSeparator.infiniteHorizon(),
                BillEditTile(
                  icon: AppIcons.description,
                  label: 'Descrição:',
                  value: state.bill.description.capitalize(),
                  onPressed: () => _pushToEditionFlow(context, Routes.billName),
                ),
                LineSeparator.infiniteHorizon(),
                BillEditTile(
                  icon: AppIcons.parcels,
                  label: AppFormatters.parcelLabelFormatter(
                    state.bill.dueEveryMonth,
                    state.bill.totalParcels,
                  ),
                  value: AppFormatters.parcelInfoFormatter(
                    state.bill.dueEveryMonth,
                    state.bill.totalParcels,
                  ),
                  onPressed: () =>
                      _pushToEditionFlow(context, Routes.billParcels),
                ),
                LineSeparator.infiniteHorizon(),
                BillEditTile(
                  icon: AppIcons.calendar,
                  label: 'Vencimento:',
                  value: state.bill.dueDayOfTheMonth.addLeadingZero(),
                  onPressed: () =>
                      _pushToEditionFlow(context, Routes.billDueDay),
                ),
                LineSeparator.infiniteHorizon(),
                BillEditTile(
                  icon: AppIcons.value,
                  label: 'Valor:',
                  value: state.bill.value.toDouble().formatCurrency(),
                  onPressed: () =>
                      _pushToEditionFlow(context, Routes.billValue),
                ),
                LineSeparator.infiniteHorizon(),
                BillEditTile(
                  icon: state.bill.category.value['icon'],
                  label: 'Categoria:',
                  value: state.bill.category.value['text'],
                  onPressed: () =>
                      _pushToEditionFlow(context, Routes.billCategory),
                ),
                const ExpandedSpace(),
                if (state.status == BaseStateStatus.loading)
                  const CircularProgressIndicator()
                else
                  PillButton(
                    onTap: () {
                      state.isEditionFlow
                          ? context.read<HomeBillsCubit>().editBill(state.bill)
                          : context
                              .read<HomeBillsCubit>()
                              .createBill(state.bill);
                      context.navigateTo(Routes.home);
                    },
                    child: const Text('Pronto'),
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
}
