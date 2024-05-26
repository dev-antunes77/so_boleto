import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/helpers/currency_ptbr_input_formatter.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';
import 'package:so_boleto/presenter/home/cubit/bill_cubit.dart';

class BillValueSection extends StatefulWidget {
  const BillValueSection(this.pageCtrl, {super.key});

  final PageController pageCtrl;

  @override
  State<BillValueSection> createState() => _BillValueSectionState();
}

class _BillValueSectionState extends State<BillValueSection> {
  final TextEditingController billValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillCubit, BillState>(
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
            ),
            BillSectionButtonRow(pageCtrl: widget.pageCtrl),
          ],
        );
      },
    );
  }
}
