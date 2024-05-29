// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_state_handler/custom_state_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab(
    this.bills, {
    super.key,
    required this.onBillSet,
    this.billStatus = BillStatus.open,
  });

  final List<BillModel> bills;
  final Function() onBillSet;
  final BillStatus billStatus;

  @override
  Widget build(BuildContext context) {
    if (bills.isEmpty) {
      return CustomStateHandler(bill: billStatus);
    }
    return ListView.separated(
      itemCount: bills.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const HorizontalThinLineSeparator(),
      itemBuilder: (context, index) {
        final bill = bills[index];
        return BillListTile(bill, onBillSet: () => onBillSet());
      },
    );
  }
}
