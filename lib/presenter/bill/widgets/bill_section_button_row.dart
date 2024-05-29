import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/routes/routes.dart';

class BillSectionDoubleButtonRow extends StatelessWidget {
  const BillSectionDoubleButtonRow({
    required this.onTap,
    super.key,
    this.isDisabled = false,
  });

  final VoidCallback onTap;
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
          onTap: onTap,
          isDisabled: isDisabled,
          child: const Text('Próximo'),
        ),
      ],
    );
  }
}
