import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/presenter/home/widgets/bill_list_tile.dart';
import 'package:so_boleto/presenter/home/widgets/list_separator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: SingleChildScrollView(
        child: ListView.separated(
          itemCount: 16,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const ListSeparator(),
          itemBuilder: (context, index) {
            return BillListTile();
          },
        ),
      ),
    );
  }
}
