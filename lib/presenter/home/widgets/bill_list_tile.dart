import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/helpers/app_formatters.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/page_transitions.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_paid_tag.dart';
import 'package:so_boleto/presenter/home/widgets/dismissable_background.dart';
import 'package:so_boleto/presenter/home/widgets/left_line_status_bar.dart';

class BillListTile extends StatelessWidget {
  const BillListTile(this.bill, {super.key});

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BillCubit>().initiateEditionFlow(bill: bill);
        context.pushTo(Routes.billCheck,
            params: PageTransitions.transitionScale);
      },
      child: Dismissible(
        key: Key(bill.id),
        direction: bill.billStatus == BillStatus.payed
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
              horizontalTitleGap: AppThemeValues.spaceXSmall,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LeftLineStatusBar(billStatus: bill.billStatus),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.grey,
                    child: SvgAsset(
                      svg: bill.category.getIconResponse(),
                      height: 30,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    bill.name.capitalize(),
                    style: context.textRobotoSubtitleSmall,
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
                  if (bill.billStatus != BillStatus.payed)
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
            BillPaidTag(bill.billStatus == BillStatus.payed)
          ],
        ),
      ),
    );
  }

  Future<bool> _confirmDismiss(
          DismissDirection direction, BuildContext context) =>
      direction == DismissDirection.endToStart
          ? AppDialogs.confirmDeleteBill(context, bill)
          : context.read<HomeBillsCubit>().setBillAsPaid(bill);
}
