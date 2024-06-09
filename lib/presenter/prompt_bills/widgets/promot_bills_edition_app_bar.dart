import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';

class PromptBillsEditionAppBar extends StatelessWidget {
  const PromptBillsEditionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      leadingBackButton: CustomBackButton(),
      title: 'Edição de contas prontas',
      actions: [],
    );
  }
}
