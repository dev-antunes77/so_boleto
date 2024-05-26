import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/thin_line_separator/horizontal_thin_line_separator.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<HomeBillsCubit, HomeBillsState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              if (state.bills.isEmpty) {
                return Center(
                  child: Text('Lista vazia'),
                );
              }
              return ListView.separated(
                itemCount: state.bills.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const HorizontalThinLineSeparator(),
                itemBuilder: (context, index) {
                  final bill = state.bills[index];
                  return BillListTile(bill);
                },
              );
            }),
      ),
    );
  }
}
