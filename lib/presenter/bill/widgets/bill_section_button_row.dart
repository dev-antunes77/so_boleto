import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class BillSectionButtonRow extends StatelessWidget {
  const BillSectionButtonRow({
    super.key,
    this.isNotFirstSection = true,
    this.isLastSection = false,
    required this.isEditionFlow,
    required this.onNavigate,
  });
  final VoidCallback onNavigate;
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
          if (isEditionFlow)
            PillButton(
              child: const Text('Pronto'),
              onTap: () => context.navigateTo(Routes.billCheck),
            )
          else ...[
            if (isNotFirstSection)
              PillButton(child: const Text('Anterior'), onTap: context.pop),
            PillButton(child: const Text('Próximo'), onTap: onNavigate),
          ]
        ],
      ),
    );
  }
}
