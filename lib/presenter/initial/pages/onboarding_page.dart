import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/initial/widgets/onboarding_bottom_navigator.dart';
import 'package:so_boleto/presenter/initial/widgets/onboarding_page_handler.dart';
import 'package:so_boleto/presenter/initial/widgets/onboarding_skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: Column(
          children: [
            AppThemeValues.spaceVerticalImense,
            Expanded(
              child: PageView.builder(
                itemCount: 5,
                allowImplicitScrolling: false,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (index < 4) const OnboardingSkipButton(),
                      OnboardingPageHandler(index),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            OnboardingBottomNavigator(pageController: _pageController),
      ),
    );
  }
}
