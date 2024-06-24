import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/loading_page/loading_animation.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class FullPageLoading extends StatelessWidget {
  const FullPageLoading({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ColoredBox(
        color: AppColors.white.withOpacity(0.6),
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: const Center(
            child: LoadingAnimation(),
          ),
        ),
      );
    }
    return Container();
  }
}
