import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
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
        return OnboardingSection(
          title: AppLocalizations.current.onboardingWelcome,
          text: AppLocalizations.current.onboardingWelcomeText,
          svg: AppIcons.onboardingWelcome,
        );
      case 1:
        return OnboardingSection(
          title: AppLocalizations.current.onboardingAgility,
          text: AppLocalizations.current.onboardingAgilityText,
          svg: AppIcons.onboardingRelax,
        );
      case 2:
        return OnboardingSection(
          title: AppLocalizations.current.onboardingNotifications,
          text: AppLocalizations.current.onboardingNotificationsText,
          svg: AppIcons.onboardingNotifications,
        );
      case 3:
        return OnboardingSection(
          title: AppLocalizations.current.onboardingControl,
          text: AppLocalizations.current.onboardingControlText,
          svg: AppIcons.onboardingExpenses,
        );
      case 4:
        return OnboardingSection(
          title: AppLocalizations.current.onboardingSaveTime,
          text: AppLocalizations.current.onboardingSaveTimeText,
          svg: AppIcons.onboardingLiving,
        );
      case 5:
        return OnboardingSection(
          title: AppLocalizations.current.onboardingStart,
          text: AppLocalizations.current.onboardingLetsGo,
          svg: AppIcons.onboardingLetsGo,
        );
    }

    return const SizedBox.shrink();
  }
}
