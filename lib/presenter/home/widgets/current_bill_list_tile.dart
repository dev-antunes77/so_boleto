import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/page_transitions.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/bill/cubit/bill_cubit.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';
import 'package:so_boleto/presenter/home/widgets/dismissable_background.dart';

class CurrentBillListTile extends StatelessWidget {
  const CurrentBillListTile(
    this.bill, {
    super.key,
    this.isTagPreferenceScreen = false,
    required this.payedTagSelector,
    required this.payedTag,
  });

  final BillModel bill;
  final Widget payedTagSelector;
  final PayedTag payedTag;
  final bool isTagPreferenceScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isTagPreferenceScreen
          ? null
          : () {
              context.read<BillCubit>().initiateEditionFlow(bill: bill);
              context.pushTo(Routes.billCheck,
                  params: PageTransitions.transitionScale);
            },
      child: Dismissible(
        key: Key(bill.id),
        direction: bill.billStatus.isPayed
            ? DismissDirection.endToStart
            : DismissDirection.horizontal,
        confirmDismiss: isTagPreferenceScreen
            ? null
            : (direction) => _confirmDismiss(direction, context),
        background: const DismissableBackGround(
          payDragging: true,
        ),
        secondaryBackground: const DismissableBackGround(),
        child: BillListTile(
          bill: bill,
          payedTag: payedTag,
          payedTagSelector: payedTagSelector,
          isTagPreferenceScreen: isTagPreferenceScreen,
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
