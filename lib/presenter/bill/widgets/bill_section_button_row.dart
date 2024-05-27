import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/routes/routes.dart';

class BillSectionButtonRow extends StatelessWidget {
  const BillSectionButtonRow(
    this.nextRoute, {
    super.key,
    this.navigateToBillCheck = false,
  });

  final String nextRoute;
  final bool navigateToBillCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PillButton(
          onTap: context.pop,
          child: const Text('Anterior'),
        ),
        PillButton(
          child: const Text('Próximo'),
          onTap: () => navigateToBillCheck
              ? context.navigateTo(Routes.billCheck)
              : context.pushTo(nextRoute),
        ),
      ],
    );
  }
}
