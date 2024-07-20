// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_payed_tag/payed_tag_selector.dart';
import 'package:so_boleto/core/components/custom_status_handler/custom_status_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/page_response_handler.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/current_bill_list_tile.dart';
import 'package:so_boleto/presenter/home/widgets/old_bill_list_tile.dart';
import 'package:so_boleto/presenter/initial/cubit/initial_cubit.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab(
    this.bills, {
    super.key,
    required this.message,
    this.isOldMonthTab = false,
    this.month,
  });

  final List<BillModel> bills;
  final PageResponseHandler message;
  final bool isOldMonthTab;
  final DateTime? month;

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<HomeBillsCubit>().state;
    if (bills.isEmpty && homeState.querySearch.isNotEmpty) {
      return const CustomStatusHandler(PageResponseHandler.noneWithThisName);
    } else if (bills.isEmpty) {
      return CustomStatusHandler(message);
    }
    final payedTag =
        context.read<InitialCubit>().state.user?.payedTag ?? PayedTag.stample;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast),
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            LineSeparator.horizontal(noPadding: true),
        itemCount: bills.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final bill = bills[index];

          return isOldMonthTab
              ? OldBillListTile(
                  bill,
                  payedTag: payedTag,
                  payedTagSelector: PayedTagSelector(
                    bill.isMonthPayed(date: month!),
                    payedTag: payedTag,
                  ),
                  month: month!,
                )
              : CurrentBillListTile(
                  bill: bill,
                  payedTag: payedTag,
                  payedTagSelector: PayedTagSelector(
                    bill.isMonthPayed(),
                    payedTag: payedTag,
                  ),
                );
        },
      ),
    );
  }
}
