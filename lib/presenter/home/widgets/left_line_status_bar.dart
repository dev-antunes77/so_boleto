import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';

class LeftLineStatusBar extends StatelessWidget {
  const LeftLineStatusBar({
    super.key,
    required this.billStatus,
  });

  final BillStatus billStatus;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-AppThemeValues.spaceSmall, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: billStatus == BillStatus.payed
              ? AppColors.primary
              : AppColors.darkRed,
        ),
        height: double.infinity,
        width: AppThemeValues.spaceXXXSmall,
      ),
    );
  }
}
