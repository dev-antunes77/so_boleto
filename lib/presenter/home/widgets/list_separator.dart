import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ListSeparator extends StatelessWidget {
  const ListSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceXXSmall,
        vertical: AppThemeValues.spaceSmall,
      ),
      color: AppColors.grey,
      height: 0.2,
    );
  }
}
