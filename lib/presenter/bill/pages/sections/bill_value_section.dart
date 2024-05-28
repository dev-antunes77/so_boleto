// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/helpers/currency_ptbr_input_formatter.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_background_card.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';

class BillValueSection extends StatefulWidget {
  const BillValueSection({
    super.key,
    this.isEditingFlow = false,
  });

  final bool isEditingFlow;
  @override
  State<BillValueSection> createState() => _BillValueSectionState();
}

class _BillValueSectionState extends State<BillValueSection> {
  final TextEditingController billValueController = TextEditingController();

  @override
  void initState() {
    billValueController.text =
        context.read<BillCubit>().state.bill.value.toDouble().formatCurrency();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BillBackgroundCard(
      child: BlocBuilder<BillCubit, BillState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Column(
            children: [
              const BillSectionTopIcon(AppIcons.value),
              BillTextField(
                hitText: 'Valor da conta',
                textInputType: TextInputType.number,
                controller: billValueController,
                onChanged: (value) =>
                    context.read<BillCubit>().onBillValueChange(value),
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyPtBrInputFormatter()
                ],
                helperText:
                    state.bill.totalParcels > 1 ? '(Valor da parcela)' : null,
              ),
              const ExpandedSpace(),
              if (widget.isEditingFlow)
                PillButton(
                  child: const Text('Pronto'),
                  onTap: () => context.pushTo(Routes.billCheck),
                )
              else
                const BillSectionButtonRow(Routes.billDueDay),
              AppThemeValues.spaceVerticalLarge,
            ],
          );
        },
      ),
    );
  }
}
