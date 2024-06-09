import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';

class PromptBillsEditionAppBar extends StatelessWidget {
  const PromptBillsEditionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leadingBackButton: const CustomBackButton(),
      title: AppLocalizations.current.prompBillEditionAppBar,
      actions: const [],
    );
  }
}
