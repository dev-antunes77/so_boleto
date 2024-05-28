import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_background_card.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_edit_tile.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class BillCheckSection extends StatefulWidget {
  const BillCheckSection({super.key});
  @override
  State<BillCheckSection> createState() => _BillCheckSectionState();
}

class _BillCheckSectionState extends State<BillCheckSection> {
  @override
  Widget build(BuildContext context) {
    final bill = context.read<BillCubit>().state.bill;
    return BillBackgroundCard(
      height: context.height * 0.75,
      child: Padding(
        padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
        child: Column(
          children: [
            BillEditTile(
              icon: AppIcons.description,
              label: 'Nome:',
              value: bill.name.capitalize(),
              width: double.infinity,
              onPressed: () => context.pushTo(Routes.billName, params: true),
            ),
            const HorizontalThinLineSeparator(horizontalPadding: 0),
            BillEditTile(
              icon: AppIcons.description,
              label: 'Descrição:',
              value: bill.description.capitalize(),
              onPressed: () =>
                  context.pushTo(Routes.billDescription, params: true),
            ),
            const HorizontalThinLineSeparator(horizontalPadding: 0),
            BillEditTile(
              icon: AppIcons.parcels,
              label: AppFormatters.parcelLabelFormatter(
                  bill.dueEveryMonth, bill.totalParcels),
              value: AppFormatters.parcelInfoFormatter(
                  bill.dueEveryMonth, bill.totalParcels),
              onPressed: () => context.pushTo(Routes.billParcels, params: true),
            ),
            const HorizontalThinLineSeparator(horizontalPadding: 0),
            BillEditTile(
              icon: AppIcons.calendar,
              label: 'Vencimento:',
              value: bill.dueDayOfTheMonth.addLeadingZero(),
              onPressed: () => context.pushTo(Routes.billDueDay, params: true),
            ),
            const HorizontalThinLineSeparator(horizontalPadding: 0),
            BillEditTile(
              icon: AppIcons.value,
              label: 'Valor:',
              value: bill.value.toDouble().formatCurrency(),
              onPressed: () => context.pushTo(Routes.billValue, params: true),
            ),
            const HorizontalThinLineSeparator(horizontalPadding: 0),
            BillEditTile(
              icon: bill.category.enumToIcon(),
              label: 'Categoria:',
              value: bill.category.enumToText(),
              onPressed: () =>
                  context.pushTo(Routes.billCategory, params: true),
            ),
            const ExpandedSpace(),
            Center(
              child: PillButton(
                onTap: () {
                  context.read<HomeBillsCubit>().createBill(bill);
                  context.read<BillCubit>().resetBill();
                  context.navigateTo(Routes.home);
                },
                child: const Text('Salvar'),
              ),
            ),
            AppThemeValues.spaceVerticalLarge
          ],
        ),
      ),
    );
  }
}
