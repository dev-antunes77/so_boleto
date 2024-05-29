import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';

class EmptyBillList extends StatelessWidget {
  const EmptyBillList({
    super.key,
    required this.bill,
  });

  final BillState bill;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgAsset(
          svg: bill == BillState.payed
              ? AppIcons.worried1
              : bill == BillState.delayed
                  ? AppIcons.happy
                  : AppIcons.sad1,
          height: 140,
          color: AppColors.grey,
        ),
        AppThemeValues.spaceVerticalLarge,
        Text(
          bill == BillState.payed
              ? 'Você não tem conta paga.'
              : bill == BillState.delayed
                  ? 'Você não tem conta atrasada.'
                  : 'Você não tem conta cadastrada.',
          style: context.textLarge.copyWith(
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}
