import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/app_bar_button.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';

class BillFlowAppBar extends StatefulWidget {
  const BillFlowAppBar({super.key});

  @override
  State<BillFlowAppBar> createState() => _BillFlowAppBarState();
}

class _BillFlowAppBarState extends State<BillFlowAppBar> {
  bool isReadyToDisplay = false;

  Future<void> delayAppBarActions() async {
    await Future.delayed(
      const Duration(milliseconds: 650),
      () => setState(() => isReadyToDisplay = true),
    );
  }

  @override
  void initState() {
    delayAppBarActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: AppLocalizations.current.billFlowNewBill,
      leadingBackButton: Visibility(
        visible: isReadyToDisplay,
        child: const CustomBackButton(),
      ),
      actions: [
        Visibility(
          visible: isReadyToDisplay,
          child: AppBarButton(
            label: AppLocalizations.current.close,
            onTap: () => AppDialogs.leaveBillCreation(context),
          ),
        )
      ],
    );
  }
}
