import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillSectionButtonRow extends StatelessWidget {
  const BillSectionButtonRow({
    super.key,
    required this.pageCtrl,
    this.isNotFirstSection = true,
    this.isLastSection = false,
    this.isEditionFlow = false,
  });
  final PageController pageCtrl;
  final bool isNotFirstSection;
  final bool isLastSection;
  final bool isEditionFlow;

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
              onTap: () => pageCtrl.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceIn),
            ),
          if (isEditionFlow)
            PillButton(
              child: const Text('Pronto'),
              onTap: () => pageCtrl.animateToPage(6,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceIn),
            )
          else
            PillButton(
              child: const Text('Próximo'),
              onTap: () => pageCtrl.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceIn),
            ),
        ],
      ),
    );
  }
}
