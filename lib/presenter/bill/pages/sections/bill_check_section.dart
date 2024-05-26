import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillCheckSection extends StatefulWidget {
  const BillCheckSection({
    super.key,
    this.isEditionFlow = false,
  });

  final bool isEditionFlow;
  @override
  State<BillCheckSection> createState() => _BillCheckSectionState();
}

class _BillCheckSectionState extends State<BillCheckSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillCubit, BillState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          children: [
            TextButton(
                onPressed: () => _moveToPage(Routes.billName),
                child: Text(state.newBill.name)),
            TextButton(
                onPressed: () => _moveToPage(Routes.billDescription),
                child: Text(state.newBill.description)),
            TextButton(
                onPressed: () => _moveToPage(Routes.billParcel),
                child: Text(state.newBill.totalParcels.toString())),
            TextButton(
                onPressed: () => _moveToPage(Routes.billValue),
                child: Text(state.newBill.value.toDouble().formatCurrency())),
            TextButton(
                onPressed: () => _moveToPage(Routes.billDueDay),
                child: Text(state.newBill.dueDayOfTheMonth.addLeadingZero())),
            TextButton(
                onPressed: () => _moveToPage(Routes.billCategory),
                child: Text(state.newBill.category.enumToText())),
            PillButton(onTap: () {}, child: const Text('Criar')),
            AppThemeValues.spaceVerticalLarge
          ],
        );
      },
    );
  }

  void _moveToPage(String route) => context.navigateTo(route);
}
