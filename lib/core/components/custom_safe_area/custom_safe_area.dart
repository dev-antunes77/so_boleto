import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_safe_area/widgets/custom_scroll_behavior.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    super.key,
    this.onRefresh,
    required this.child,
  });

  final Future<void> Function()? onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: onRefresh != null
            ? RefreshIndicator(
                onRefresh: onRefresh!,
                child: child,
              )
            : child,
      ),
    );
  }
}
