import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillSectionButtonRow extends StatelessWidget {
  const BillSectionButtonRow({
    super.key,
    required this.navigateSection,
    this.isNotFirstSection = true,
  });

  final Function(bool p1) navigateSection;
  final bool isNotFirstSection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppThemeValues.spaceXLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (isNotFirstSection)
            PillButton(
              child: const Text('Anterior'),
              onTap: () => navigateSection(false),
            ),
          PillButton(
            child: const Text('Próximo'),
            onTap: () => navigateSection(true),
          ),
        ],
      ),
    );
  }
}
