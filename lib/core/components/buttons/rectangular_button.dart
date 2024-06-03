import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.label,
    required this.isValid,
    required this.onTap,
  });

  final String label;
  final bool isValid;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(),
      ),
      color: isValid ? AppColors.primary : AppColors.grey,
      child: Center(
        child: InkWell(
          onTap: isValid ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: context.textRobotoSubtitleSmall.copyWith(
                color: AppColors.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
