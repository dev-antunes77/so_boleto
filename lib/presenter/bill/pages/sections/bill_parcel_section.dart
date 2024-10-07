import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/components/custom_dropdown_menu/custom_dropdown_menu.dart';
import 'package:so_boleto/core/components/expanded_section/expanded_section.dart';
import 'package:so_boleto/core/components/expanded_space/expanded_space.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_parcel_switch_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_section_button_row.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_shell.dart';

class BillParcelSection extends StatefulWidget {
  const BillParcelSection({super.key});

  @override
  State<BillParcelSection> createState() => _BillParcelSectionState();
}

class _BillParcelSectionState extends State<BillParcelSection> {
  bool parcelChoice = false;
  bool uniqueChoice = false;
  bool monthlyChoice = false;

  @override
  Widget build(BuildContext context) {
    return BillShell(
      height: context.height * 0.5,
      child: Column(
        children: [
          AppThemeValues.spaceVerticalImense,
          Padding(
            padding: const EdgeInsets.only(left: AppThemeValues.spaceLarge),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tipo de conta:',
                style: context.textRobotoSubtitleMediumToLarge,
              ),
            ),
          ),
          AppThemeValues.spaceVerticalLarge,
          BillParcelSwitchRow(
            label: 'Mensal?',
            choice: monthlyChoice,
            onChanged: (value) => setState(() {
              monthlyChoice = value;
              parcelChoice = false;
              uniqueChoice = false;
              context.read<BillCubit>().onBillMonthlyChange(value);
            }),
          ),
          BillParcelSwitchRow(
            label: 'Única?',
            choice: uniqueChoice,
            onChanged: (value) => setState(() {
              uniqueChoice = value;
              parcelChoice = false;
              monthlyChoice = false;
              context.read<BillCubit>().onBillParcelsChange(billParcels: 1);
            }),
          ),
          BillParcelSwitchRow(
            label: 'Parcelada?',
            choice: parcelChoice,
            onChanged: (value) => setState(() {
              parcelChoice = value;
              monthlyChoice = false;
              uniqueChoice = false;
              context.read<BillCubit>().onBillParcelsChange(billParcels: 2);
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
                      AppLocalizations.current.billFlowHowManyParcels,
                      style: context.textRobotoSubtitleMedium,
                    ),
                    AppThemeValues.spaceHorizontalLarge,
                    BlocBuilder<BillCubit, BillState>(
                      builder: (context, state) {
                        return CustomDropdownMenu(
                          value: state.bill.totalParcels,
                          items: AppConstants.parcelsLength
                              .map(
                                (e) => DropdownMenuItem<int>(
                                  value: e,
                                  child: Text(
                                    e.addLeadingZero(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => _onSelectingParcels(value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          const ExpandedSpace(),
          if (context.read<BillCubit>().state.isEditionFlow)
            PillButton(
              child: Text(AppLocalizations.current.done),
              onTap: () => context.navigateTo(Routes.billCheck),
            )
          else
            BillSectionDoubleButtonRow(
              onTap: () => context.pushTo(Routes.billValue),
              isDisabled: _disableButton(),
            ),
          AppThemeValues.spaceVerticalLarge,
        ],
      ),
    );
  }

  void _onSelectingParcels(int value) {
    setState(() {
      if (value == 1) {
        parcelChoice = false;
      }
      context.read<BillCubit>().onBillParcelsChange(billParcels: value);
    });
  }

  bool _disableButton() => !parcelChoice && !monthlyChoice && !uniqueChoice;
}
