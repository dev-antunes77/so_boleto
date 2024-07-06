import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Center(
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
