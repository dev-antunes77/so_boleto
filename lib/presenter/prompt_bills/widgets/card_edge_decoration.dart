import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class CardEdgeDecoration extends StatelessWidget {
  const CardEdgeDecoration({
    super.key,
    required this.alignment,
    this.bottomLeftRadius = false,
    this.topLefttRadius = false,
    this.bottomRightRadius = false,
    this.topRightRadius = false,
  });

  final Alignment alignment;
  final bool bottomLeftRadius;
  final bool topLefttRadius;
  final bool bottomRightRadius;
  final bool topRightRadius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft:
                bottomLeftRadius ? const Radius.circular(10) : Radius.zero,
            topLeft: topLefttRadius ? const Radius.circular(10) : Radius.zero,
            bottomRight:
                bottomRightRadius ? const Radius.circular(10) : Radius.zero,
            topRight: topRightRadius ? const Radius.circular(10) : Radius.zero,
          ),
        ),
        child: const SizedBox(
          height: 14,
          width: 14,
        ),
      ),
    );
  }
}
