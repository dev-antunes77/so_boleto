// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_state_handler/custom_state_handler.dart';
import 'package:so_boleto/core/components/custom_state_handler/enum/message_handler.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';

class HomeBillTab extends StatelessWidget {
  const HomeBillTab(
    this.bills, {
    super.key,
    required this.message,
  });

  final List<BillModel> bills;
  final MessageHandler message;

  @override
  Widget build(BuildContext context) {
    if (bills.isEmpty &&
        context.read<HomeBillsCubit>().state.querySearch.isNotEmpty) {
      return const CustomStateHandler(MessageHandler.noneWithThisName);
    } else if (bills.isEmpty) {
      return CustomStateHandler(message);
    }
    return ListView.separated(
      itemCount: bills.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const HorizontalThinLineSeparator(),
      itemBuilder: (context, index) {
        final bill = bills[index];
        return BillListTile(bill);
      },
    );
  }
}
