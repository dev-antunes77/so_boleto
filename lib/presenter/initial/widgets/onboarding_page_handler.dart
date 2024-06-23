import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/presenter/initial/widgets/onboarding_section.dart';

class OnboardingPageHandler extends StatelessWidget {
  const OnboardingPageHandler(
    this.pageIndex, {
    super.key,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    switch (pageIndex) {
      case 0:
        return const OnboardingSection(
          title: 'Bem-vindo',
          text:
              'Só Boleto vai ser o seu assitente pessoal de contas daqui em diante, ok?\n\nDeixa com a gente.',
          svg: AppIcons.onboarding1,
        );
      case 1:
        return const OnboardingSection(
          title: 'Agilidade',
          text:
              'Contas registradas serão gerenciadas de forma simples e rápida.\n\nRelaxe!',
          svg: AppIcons.onboarding5,
        );
      case 2:
        return const OnboardingSection(
          title: 'Notificações',
          text: 'Vamos notificá-lo quando uma conta estiver perto de vencer.',
          svg: AppIcons.onboarding3,
        );
      case 3:
        return const OnboardingSection(
          title: 'Poupe seu tempo',
          text:
              'Deixa de lado as preocupações com os vencimentos e aproveite a vida.',
          svg: AppIcons.onboarding4,
        );
      case 4:
        return const OnboardingSection(
          title: 'Comece agora',
          text: 'Vamos lá?',
          svg: AppIcons.onboarding2,
        );
    }

    return const SizedBox.shrink();
  }
}
