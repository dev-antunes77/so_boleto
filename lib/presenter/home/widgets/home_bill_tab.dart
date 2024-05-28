// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab(this.bills, {super.key, required this.onBillSet});

  final List<BillModel> bills;
  final Function() onBillSet;

  @override
  Widget build(BuildContext context) {
    if (bills.isEmpty) {
      return const Center(
        child: Text('Lista vazia'),
      );
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
