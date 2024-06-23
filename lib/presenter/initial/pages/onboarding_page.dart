import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_pop_scope/custom_pop_scope.dart';
import 'package:so_boleto/core/components/loading_page/loading_page.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
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
    return CustomPopScope(
      leaveTheApp: true,
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: BlocListener<InitialCubit, InitialState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              showDialog(
                context: context,
                builder: (context) => const LoadingPage2(),
              );
            }
          },
          child: Column(
            children: [
              AppThemeValues.spaceVerticalImense,
              Expanded(
                child: PageView.builder(
                  itemCount: 6,
                  allowImplicitScrolling: false,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index < 5)
                          OnboardingSkipButton(
                            onSkip: _onSkipOnboardingPressed,
                          ),
                        OnboardingPageHandler(index),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            OnboardingBottomNavigator(pageController: _pageController),
      ),
    );
  }

  void _onSkipOnboardingPressed() {
    context.showDialog(
      title: 'Pular boas vindas?',
      description: "Tem certeza que deseja pular a tela de boas vindas?",
      onAcept: () {
        context.pop(true);
        context.read<InitialCubit>().onSkipOnboarding().then(
              (_) => context.navigateTo(Routes.home),
            );
      },
    );
  }
}
