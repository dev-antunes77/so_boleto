import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/enum_extension.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_paid_tag.dart';
import 'package:so_boleto/presenter/home/widgets/dismissable_background.dart';

class BillListTile extends StatelessWidget {
  const BillListTile(this.bill, {super.key, required this.onBillSet});

  final BillModel bill;
  final Function() onBillSet;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(bill.id),
      direction: bill.billState == BillState.payed
          ? DismissDirection.endToStart
          : DismissDirection.horizontal,
      confirmDismiss: (direction) => _confirmDismiss(direction, context),
      background: const DismissableBackGround(
        payDragging: true,
      ),
      secondaryBackground: const DismissableBackGround(),
      child: Stack(
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
                color: AppColors.primaryLight,
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
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (bill.billState != BillState.payed)
                  Text(
                    bill.dueDayOfTheMonth.properDueDay(),
                    style: context.textRobotoSubtitleTiny,
                  ),
              ],
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
          BillPaidTag(bill.billState == BillState.payed)
        ],
      ),
    );
  }

  Future<bool> _confirmDismiss(
          DismissDirection direction, BuildContext context) =>
      direction == DismissDirection.endToStart
          ? AppDialogs.confirmDeleteBill(context, bill)
          : context
              .read<HomeBillsCubit>()
              .setBillAsPaid(bill)
              .then((_) => onBillSet());
}

class UnderlineStatusLabel extends StatelessWidget {
  const UnderlineStatusLabel({
    super.key,
    required this.bill,
  });

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: bill.billState == BillState.payed
                ? AppColors.primary
                : AppColors.background,
          ),
          height: 10,
          width: double.infinity,
        ),
        Text(
          bill.billState.billStateToText(),
          style: context.textXSmall.copyWith(
            color: AppColors.background,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        )
      ],
    );
  }
}
