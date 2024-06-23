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
          svg: AppIcons.onboardingWelcome,
        );
      case 1:
        return const OnboardingSection(
          title: 'Agilidade',
          text:
              'Contas registradas serão gerenciadas de forma simples e rápida.\n\nRelaxe!',
          svg: AppIcons.onboardingRelax,
        );
      case 2:
        return const OnboardingSection(
          title: 'Notificações',
          text: 'Vamos notificá-lo quando uma conta estiver perto de vencer.',
          svg: AppIcons.onboardingNotifications,
        );
      case 3:
        return const OnboardingSection(
          title: 'Controle',
          text:
              'Acompanhe seus gastos mensais.\nDo mês atual até 6 meses anteriores.',
          svg: AppIcons.onboardingExpenses,
        );
      case 4:
        return const OnboardingSection(
          title: 'Poupe seu tempo',
          text:
              'Deixa de lado as preocupações com os vencimentos de suas contas e aproveite a vida.',
          svg: AppIcons.onboardingLiving,
        );
      case 5:
        return const OnboardingSection(
          title: 'Comece agora',
          text: 'Vamos lá?',
          svg: AppIcons.onboardingLetsGo,
        );
    }

    return const SizedBox.shrink();
  }
}
