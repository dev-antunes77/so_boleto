import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_icons.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';

class BillListTile extends StatelessWidget {
  const BillListTile({
    super.key,
    required this.bill,
    required this.payedTagSelector,
    this.isTagPreferenceScreen = false,
    required this.payedTag,
  });

  final BillModel bill;
  final Widget payedTagSelector;
  final PayedTag payedTag;

  final bool isTagPreferenceScreen;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().state;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bill.billStatus.isPayed
            ? theme.selectedColors.cardBackground
            : null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppThemeValues.spaceXXSmall,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppThemeValues.spaceSmall,
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: Text(
                      payedTag.isStample && bill.billStatus.isPayed
                          ? bill.name.capitalize().breakLongStrings(
                              length: bill.name.length, desiredLength: 15)
                          : bill.name.capitalize(),
                      style: context.textRobotoSubtitleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (bill.description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppThemeValues.spaceXXSmall,
                      ),
                      child: Transform.rotate(
                        angle: pi / 8.0,
                        child: SvgAsset(
                          svg: AppIcons.notebook,
                          color: theme.selectedColors.primary,
                          height: 20,
                        ),
                      ),
                    ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (bill.billStatus != BillStatus.payed)
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
                    padding: EdgeInsets.all(AppThemeValues.spaceSmall),
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
