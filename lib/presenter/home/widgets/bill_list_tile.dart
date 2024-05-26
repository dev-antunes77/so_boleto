import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';

class BillListTile extends StatelessWidget {
  const BillListTile(
    this.bill, {
    super.key,
  });

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppThemeValues.spaceSmall,
          ),
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.greyLight,
            child: SvgAsset(
              svg: AppIcons.payment,
              height: 28,
              color: AppColors.primary,
            ),
          ),
          title: Text(
            'Alimentação',
            style: context.textRobotoSubtitleMedium,
          ),
          subtitle: Text(
            'vence em 10 dias',
            style: context.textRobotoSubtitleTiny,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '2 de 5',
                textAlign: TextAlign.center,
                style: context.textRobotoSubtitleTiny,
              ),
              const Padding(
                padding: EdgeInsets.all(AppThemeValues.spaceSmall),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
