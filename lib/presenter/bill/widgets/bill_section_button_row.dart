import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/routes/routes.dart';

class BillSectionButtonRow extends StatelessWidget {
  const BillSectionButtonRow(
    this.nextRoute, {
    super.key,
    this.navigateToBillCheck = false,
    this.isDisabled = false,
  });

  final String nextRoute;
  final bool navigateToBillCheck;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PillButton(
          onTap: () => context.pop(true),
          child: const Text('Anterior'),
        ),
        PillButton(
          onTap: () => navigateToBillCheck
              ? context.navigateTo(Routes.billCheck)
              : context.pushTo(nextRoute),
          isDisabled: isDisabled,
          child: const Text('Próximo'),
        ),
      ],
    );
  }
}
