import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';

class ExpensesAppBar extends StatelessWidget {
  const ExpensesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: AppLocalizations.current.expenses,
      actions: const [],
    );
  }
}
