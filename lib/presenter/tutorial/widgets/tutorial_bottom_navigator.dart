import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/custom_text_button.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/tutorial/widgets/tutorial_page_indicator.dart';

class TutorialBottomNavigator extends StatefulWidget {
  const TutorialBottomNavigator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<TutorialBottomNavigator> createState() =>
      _TutorialBottomNavigatorState();
}

class _TutorialBottomNavigatorState extends State<TutorialBottomNavigator>
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
        SizedBox(
          height: AppThemeValues.spaceLarge,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TutorialPageIndicator(
                hasOpacity: _currentPage != 0,
                animationController: _animationController,
              ),
              AppThemeValues.spaceHorizontalXXXSmall,
              TutorialPageIndicator(
                hasOpacity: _currentPage != 1,
                animationController: _animationController,
              ),
              AppThemeValues.spaceHorizontalXXXSmall,
              TutorialPageIndicator(
                hasOpacity: _currentPage != 2,
                animationController: _animationController,
              ),
              AppThemeValues.spaceHorizontalXXXSmall,
              TutorialPageIndicator(
                hasOpacity: _currentPage != 3,
                animationController: _animationController,
              ),
            ],
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
        AppThemeValues.spaceVerticalXXSmall,
      ],
    );
  }

  void _onNextPage() {
    setState(() => _currentPage++);
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceOut,
    );
    _animateDot();
  }

  void _onPriviousPage() {
    setState(() => _currentPage--);
    widget.pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceOut,
    );
    _animateDot();
  }

  void _animateDot() {
    _animationController.reset();
    _animationController.forward();
    setState(() {});
  }
}
