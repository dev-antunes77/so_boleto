import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
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
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.greyLight,
            child: SvgAsset(
              svg: bill.category.enumToIcon(),
              height: 32,
              color: AppColors.primary,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                bill.name.capitalize(),
                style: context.textRobotoSubtitleMedium,
              ),
              if (bill.description.isNotEmpty)
                Text(
                  bill.description.capitalize(),
                  style: context.textRobotoXSmall,
                ),
            ],
          ),
          subtitle: Text(
            bill.dueDayOfTheMonth.properDueDay(),
            style: context.textRobotoSubtitleTiny,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text(
                    bill.value.toDouble().formatCurrency(),
                    style: context.textSubtitleSmall,
                  ),
                  Text(
                    AppFormatters.parcelRelationFormatter(bill.dueEveryMonth,
                        bill.totalParcels, bill.payedParcels),
                    textAlign: TextAlign.center,
                    style: context.textRobotoSubtitleTiny,
                  ),
                ],
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
