import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class TutorialPageIndicator extends StatelessWidget {
  const TutorialPageIndicator({
    super.key,
    required this.hasOpacity,
    required this.animationController,
  });
  final AnimationController animationController;
  final bool hasOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        Color? dotColor = Color.lerp(AppColors.primary.withOpacity(0.4),
            AppColors.primary, animationController.value);
        return DecoratedBox(
          decoration: BoxDecoration(
            color: hasOpacity ? AppColors.primary.withOpacity(0.4) : dotColor,
            shape: BoxShape.circle,
          ),
          child: SizedBox.square(
            dimension: hasOpacity ? 10 : 10 + (3 * animationController.value),
          ),
        );
      },
    );
  }
}
