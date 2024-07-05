import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/app_bar_button.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';

class BillFlowAppBar extends StatefulWidget {
  const BillFlowAppBar({super.key});

  @override
  State<BillFlowAppBar> createState() => _BillFlowAppBarState();
}

class _BillFlowAppBarState extends State<BillFlowAppBar> {
  bool isReadyToDisplay = false;

  late BillModel? _bill;
  late final bool isEditionFlow;

  @override
  void initState() {
    delayAppBarActions();
    final billState = context.read<BillCubit>().state;
    isEditionFlow = billState.isEditionFlow;

    _bill = isEditionFlow ? billState.bill : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: _bill == null
          ? AppLocalizations.current.billFlowNewBill
          : AppLocalizations.current.billFlowBillEdition,
      leadingBackButton: Visibility(
        visible: isReadyToDisplay,
        child:
            isEditionFlow ? const SizedBox.shrink() : const CustomBackButton(),
      ),
      actions: [
        Visibility(
          visible: isReadyToDisplay && _bill == null,
          child: Padding(
            padding: const EdgeInsets.only(right: AppThemeValues.spaceSmall),
            child: AppBarButton(
              label: AppLocalizations.current.close,
              colors: context.read<ThemeCubit>().state.selectedColors,
              onTap: () => AppDialogs.leaveBillCreation(context),
            ),
          ),
        )
      ],
    );
  }

  Future<void> delayAppBarActions() async {
    await Future.delayed(
      const Duration(milliseconds: 650),
      () => setState(() => isReadyToDisplay = true),
    );
  }
}
