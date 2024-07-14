import 'package:flutter/material.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';

class OldBillListTile extends StatelessWidget {
  const OldBillListTile(
    this.bill, {
    super.key,
    required this.payedTagSelector,
    required this.payedTag,
    required this.month,
  });

  final BillModel bill;
  final PayedTag payedTag;
  final DateTime month;
  final Widget payedTagSelector;

  @override
  Widget build(BuildContext context) {
    return BillListTile(
      bill: bill,
      payedTagSelector: payedTagSelector,
      payedTag: payedTag,
      date: month,
    );
  }
}
