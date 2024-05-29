import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';

class CustomStateHandler extends StatelessWidget {
  const CustomStateHandler({
    super.key,
    this.bill,
  });

  final BillStatus? bill;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgAsset(
          svg: bill == null
              ? AppIcons.error
              : bill == BillStatus.payed
                  ? AppIcons.worried1
                  : bill == BillStatus.delayed
                      ? AppIcons.happy
                      : AppIcons.sad1,
          height: 140,
          color: AppColors.grey,
        ),
        AppThemeValues.spaceVerticalLarge,
        Text(
          bill == null
              ? 'Ops!\nAlgo deu errado.'
              : bill == BillStatus.payed
                  ? 'Você não tem contas pagas.'
                  : bill == BillStatus.delayed
                      ? 'Você não tem contas atrasadas.'
                      : 'Você não tem contas cadastradas.',
          textAlign: TextAlign.center,
          style: context.textLarge.copyWith(
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}
