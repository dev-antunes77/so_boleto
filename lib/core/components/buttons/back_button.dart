import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.pop(true),
      icon: const Icon(
        Icons.arrow_back,
        size: 25,
        color: AppColors.grey,
      ),
    );
  }
}
