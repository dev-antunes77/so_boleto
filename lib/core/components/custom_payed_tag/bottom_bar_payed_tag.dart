import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class BottomBarTag extends StatelessWidget {
  const BottomBarTag({
    super.key,
    required this.showTag,
    required this.color,
  });

  final bool showTag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return showTag
        ? Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 14,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: color,
              ),
              child: const Center(
                child: Text(
                  'P A G A',
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
