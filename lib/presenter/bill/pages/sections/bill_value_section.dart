// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/helpers/currency_ptbr_input_formatter.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_top_icon.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_text_field.dart';

class BillValueSection extends StatefulWidget {
  const BillValueSection({super.key});

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
    return BillShell(
      child: BlocBuilder<BillCubit, BillState>(
        buildWhen: (previous, current) =>
            previous.bill.value != current.bill.value,
        builder: (context, state) {
          return Column(
            children: [
              const BillSectionTopIcon(AppIcons.value),
              BillTextField(
                hitText: AppLocalizations.current.billFlowValueTitle,
                textInputType: TextInputType.number,
                controller: billValueController,
                onChanged: (value) =>
                    context.read<BillCubit>().onBillValueChange(value),
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyPtBrInputFormatter()
                ],
                helperText: state.bill.totalParcels > 1
                    ? AppLocalizations.current.billFlowParcelValue
                    : null,
                onSubmitted: (p0) => _onSubmitted(
                  state.bill.value,
                  state.isEditionFlow,
                ),
              ),
              const ExpandedSpace(),
              if (state.isEditionFlow)
                PillButton(
                  child: Text(AppLocalizations.current.done),
                  onTap: () => context.navigateTo(Routes.billCheck),
                )
              else
                BillSectionDoubleButtonRow(
                  onTap: () => context.pushTo(Routes.billDueDay),
                  isDisabled: _disableButton(state.bill.value),
                ),
              AppThemeValues.spaceVerticalLarge,
            ],
          );
        },
      ),
    );
  }

  bool _disableButton(int value) => value < 1;

  _onSubmitted(int value, bool isEditionFlow) {
    if (isEditionFlow) return;
    if (!_disableButton(value)) {
      context.pushTo(Routes.billDueDay);
    }
  }
}
