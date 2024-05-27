import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_edit_tile.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class BillCheckSection extends StatefulWidget {
  const BillCheckSection(this.pageCtrl, {super.key});
  final PageController pageCtrl;
  @override
  State<BillCheckSection> createState() => _BillCheckSectionState();
}

class _BillCheckSectionState extends State<BillCheckSection> {
  @override
  Widget build(BuildContext context) {
    final bill = context.read<BillCubit>().state.bill;
    return Padding(
      padding: const EdgeInsets.all(AppThemeValues.spaceMedium),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: BillEditTile(
              label: 'Nome:',
              value: bill.name,
              width: double.infinity,
              onPressed: () => _moveToPage(0),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: BillEditTile(
              label: 'Descrição:',
              width: double.infinity,
              value: bill.description,
              onPressed: () => _moveToPage(1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BillEditTile(
                label: 'Valor:',
                value: bill.value.toDouble().formatCurrency(),
                onPressed: () => _moveToPage(3),
              ),
              BillEditTile(
                label: 'Vencimento:',
                value: bill.dueDayOfTheMonth.addLeadingZero(),
                onPressed: () => _moveToPage(4),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BillEditTile(
                label: 'Parcelas:',
                value: bill.totalParcels.toString(),
                onPressed: () => _moveToPage(2),
              ),
              BillEditTile(
                label: 'Categoria:',
                value: bill.category.enumToText(),
                onPressed: () => _moveToPage(5),
              ),
            ],
          ),
          const ExpandedSpace(),
          Center(
            child: PillButton(
              onTap: () {
                context.read<HomeBillsCubit>().createBill(bill);
                context.navigateTo(Routes.home);
              },
              child: const Text('Salvar'),
            ),
          ),
          AppThemeValues.spaceVerticalLarge
        ],
      ),
    );
  }

  void _moveToPage(int page) => widget.pageCtrl.animateToPage(page,
      duration: const Duration(milliseconds: 400), curve: Curves.bounceIn);
}
