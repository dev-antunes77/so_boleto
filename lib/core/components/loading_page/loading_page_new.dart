import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/loading_page/loading_page.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class FullPageLoadingStack extends StatelessWidget {
  const FullPageLoadingStack({
    super.key,
    required this.child,
    required this.overlayBuilder,
  });

  final Widget child;
  final Widget overlayBuilder;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [child, overlayBuilder],
      ),
    );
  }
}

class FullPageLoadingOrEmpty extends StatelessWidget {
  const FullPageLoadingOrEmpty({super.key, required this.isNotEmpty});

  final bool isNotEmpty;

  @override
  Widget build(BuildContext context) {
    if (isNotEmpty) {
      return ColoredBox(
        color: AppColors.white.withOpacity(0.5),
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: const Center(
            child: LoadingPage2(),
          ),
        ),
      );
    }
    return Container();
  }
}

class FullPageLoading extends StatelessWidget {
  const FullPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white.withOpacity(0.4),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(AppThemeValues.spaceHuge),
            child: LoadingPage3(),
          ),
        ),
      ),
    );
  }
}
