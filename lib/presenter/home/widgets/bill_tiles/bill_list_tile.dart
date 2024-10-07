import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_category_icon/custom_category_item.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
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
    required this.payedTag,
    required this.date,
  });

  final BillModel bill;
  final Widget payedTagSelector;
  final PayedTag payedTag;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;
    final payedThisMonth = bill.isMonthPayed(date: date);
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
              leading: CustomCategoryItem(category: bill.category),
              title: Text(
                payedTag.isStample && payedThisMonth
                    ? bill.name.breakLongStrings(
                        length: bill.name.length,
                        desiredLength: 18,
                      )
                    : bill.name,
                style: context.textRobotoSubtitleSmall,
                maxLines: 1,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (bill.description.isNotEmpty)
                    Text(
                      payedTag.isStample && payedThisMonth
                          ? bill.description.breakLongStrings(
                              length: bill.description.length,
                              desiredLength: 22,
                            )
                          : bill.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (payedThisMonth)
                    Text(
                      AppLocalizations.current
                          .payedAt(bill.getPaymentDate(date)),
                      style: context.textRobotoSubtitleTiny,
                    )
                  else
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
