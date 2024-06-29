import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/pill_button.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_title_sections.dart';

class DueDayChoice extends StatelessWidget {
  const DueDayChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileTitleSection('Escolha um vencimento'),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppThemeValues.spaceLarge),
          child: Column(
            children: [
              const Text(
                'Ao selecionar um dia, todas as contas criadas terão automaticamente esse dia como vencimento. Você ainda pode alterar isso ao editar a conta.',
                textAlign: TextAlign.center,
              ),
              AppThemeValues.spaceVerticalSmall,
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: AppThemeValues.spaceTiny,
                  mainAxisSpacing: AppThemeValues.spaceTiny,
                ),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 31,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Center(child: Text('${index + 1}')),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        PillButton(
          onTap: () {},
          child: const Text('Pronto'),
        ),
      ],
    );
  }
}
