import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class HorizontalThinLineSeparator extends StatelessWidget {
  const HorizontalThinLineSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 30, color: AppColors.greyLight, width: 2);
  }
}
