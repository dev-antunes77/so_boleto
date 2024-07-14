import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';

class BillListTile extends StatelessWidget {
  const BillListTile({
    super.key,
    required this.bill,
    required this.payedTagSelector,
    this.isTagPreferenceScreen = false,
    required this.payedTag,
    required this.date,
  });

  final BillModel bill;
  final Widget payedTagSelector;
  final PayedTag payedTag;
  final DateTime date;

  final bool isTagPreferenceScreen;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;
    final payedThisMonth = bill.billPayment
        .firstWhere((e) => e.referredMonth.month == date.month)
        .billStatus
        .isPayed;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: payedThisMonth ? theme.selectedColors.cardBackground : null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppThemeValues.spaceXXSmall,
            ),
            child: ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppThemeValues.spaceXXSmall,
              ),
              horizontalTitleGap: AppThemeValues.spaceXSmall,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: theme.selectedColors.circleBackground,
                    child: SvgAsset(
                      svg: bill.category.getIconResponse,
                      height: 30,
                      color: theme.selectedColors.icon,
                    ),
                  ),
                ],
              ),
              title: Text(
                payedTag.isStample && payedThisMonth
                    ? bill.name.capitalize().breakLongStrings(
                          length: bill.name.length,
                          desiredLength: 18,
                        )
                    : bill.name.capitalize(),
                style: context.textRobotoSubtitleSmall,
                maxLines: 1,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (bill.description.isNotEmpty)
                    Text(
                      payedTag.isStample && payedThisMonth
                          ? bill.description.capitalize().breakLongStrings(
                                length: bill.description.length,
                                desiredLength: 22,
                              )
                          : bill.description.capitalize(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (!payedThisMonth)
                    Text(
                      bill.dueDay.properDueDay(),
                      style: context.textRobotoSubtitleTiny,
                    ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bill.value.toDouble().formatCurrency(),
                        style: bill.value <= 0
                            ? context.textRobotoSubtitleTiny
                            : context.textRobotoSubtitleXSmall,
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        AppFormatters.parcelRelationFormatter(
                          bill.totalParcels,
                          bill.payedParcels,
                        ),
                        textAlign: TextAlign.right,
                        style: context.textRobotoSubtitleTiny,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(AppThemeValues.spaceXXXSmall),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          payedTagSelector,
        ],
      ),
    );
  }
}
