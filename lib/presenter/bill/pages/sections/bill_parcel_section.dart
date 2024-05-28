import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_background_card.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_dropdown_menu.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_parcel_switch_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';

class BillParcelSection extends StatefulWidget {
  const BillParcelSection({
    super.key,
    this.isEditingFlow = false,
  });

  final bool isEditingFlow;

  @override
  State<BillParcelSection> createState() => _BillParcelSectionState();
}

class _BillParcelSectionState extends State<BillParcelSection> {
  bool parcelChoice = false;
  bool monthlyChoice = false;
  bool uniqueChoice = false;

  @override
  Widget build(BuildContext context) {
    return BillBackgroundCard(
      child: Column(
        children: [
          AppThemeValues.spaceVerticalImense,
          BillParcelSwitchRow(
            label: 'Essa é uma conta mensal?',
            choice: monthlyChoice,
            onChanged: (value) => setState(() {
              monthlyChoice = value;
              parcelChoice = false;
              uniqueChoice = false;
              context.read<BillCubit>().onBillMonthlyChange(value);
            }),
          ),
          BillParcelSwitchRow(
            label: 'Uma conta única?',
            choice: uniqueChoice,
            onChanged: (value) => setState(() {
              uniqueChoice = value;
              parcelChoice = false;
              monthlyChoice = false;
              context.read<BillCubit>().onBillParcelsChange(1);
            }),
          ),
          BillParcelSwitchRow(
            label: 'Ou uma conta parcelada?',
            choice: parcelChoice,
            onChanged: (value) => setState(() {
              parcelChoice = value;
              uniqueChoice = false;
              monthlyChoice = false;
              context.read<BillCubit>().onBillParcelsChange(2);
            }),
          ),
          if (parcelChoice)
            ExpandedSection(
              expand: parcelChoice,
              child: Padding(
                padding: const EdgeInsets.only(top: AppThemeValues.spaceSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quantas parcelas?',
                      style: context.textRobotoSubtitleMedium,
                    ),
                    AppThemeValues.spaceHorizontalLarge,
                    BlocBuilder<BillCubit, BillState>(
                      builder: (context, state) {
                        return BillDropdownMenu(
                            list: AppConstants.parcelsLength,
                            dueDayOfTheMonth: state.bill.totalParcels,
                            onChanged: (value) => _onSelectingParcels(value));
                      },
                    ),
                  ],
                ),
              ),
            ),
          const ExpandedSpace(),
          if (widget.isEditingFlow)
            PillButton(
              child: const Text('Pronto'),
              onTap: () => context.pushTo(Routes.billCheck),
            )
          else
            const BillSectionButtonRow(Routes.billValue),
          AppThemeValues.spaceVerticalLarge,
        ],
      ),
    );
  }

  void _onSelectingParcels(int value) {
    if (value == 1) {
      parcelChoice = false;
      uniqueChoice = true;
      setState(() {});
    }
    context.read<BillCubit>().onBillParcelsChange(value);
  }
}
