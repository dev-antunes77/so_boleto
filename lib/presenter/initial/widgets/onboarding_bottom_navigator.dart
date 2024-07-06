import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/buttons/custom_text_button.dart';
import 'package:so_boleto/core/components/buttons/rectangular_button.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';
import 'package:so_boleto/presenter/initial/widgets/onboarding_page_indicator.dart';

class OnboardingBottomNavigator extends StatefulWidget {
  const OnboardingBottomNavigator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<OnboardingBottomNavigator> createState() =>
      _OnboardingBottomNavigatorState();
}

class _OnboardingBottomNavigatorState extends State<OnboardingBottomNavigator>
    with TickerProviderStateMixin {
  int _currentPage = 0;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_currentPage == 5)
          Column(
            children: [
              RectangularButton(
                label: AppLocalizations.current.onboardingStart,
                isValid: true,
                onTap: () =>
                    context.read<InitialCubit>().onSkipOnboarding().then(
                          (_) => context.navigateTo(Routes.home),
                        ),
              ),
              AppThemeValues.spaceVerticalSmall,
              RectangularButton.inverse(
                label: AppLocalizations.current.back,
                isValid: true,
                onTap: _onPriviousPage,
              ),
              AppThemeValues.spaceVerticalTitanic,
            ],
          )
        else ...[
          SizedBox(
            height: AppThemeValues.spaceLarge,
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) =>
                  AppThemeValues.spaceHorizontalXXXSmall,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => OnboardingPageIndicator(
                hasOpacity: _currentPage != index,
                animationController: _animationController,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                label: 'Voltar',
                disable: _currentPage == 0,
                onPressed: _onPriviousPage,
              ),
              CustomTextButton(
                label: 'Próximo',
                onPressed: _onNextPage,
              ),
            ],
          ),
        ],
        AppThemeValues.spaceVerticalXXSmall,
      ],
    );
  }

  void _onNextPage() {
    setState(() => _currentPage++);
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    _animateDot();
  }

  void _onPriviousPage() {
    setState(() => _currentPage--);
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    _animateDot();
  }

  void _animateDot() {
    _animationController.reset();
    _animationController.forward();
    setState(() {});
  }
}
