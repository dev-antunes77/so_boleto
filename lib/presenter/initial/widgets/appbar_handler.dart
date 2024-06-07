import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_flow_app_bar.dart';
import 'package:so_boleto/presenter/home/widgets/home_app_bar.dart';
import 'package:so_boleto/presenter/prompt_bills/widgets/prompt_bills_app_bar.dart';

class AppBarHandler extends StatelessWidget {
  const AppBarHandler(this.route, {super.key});
  final String route;

  @override
  Widget build(BuildContext context) {
    if (route == Routes.expenses) {
      return const SizedBox.shrink();
    } else if (route == Routes.profile) {
      return const SizedBox.shrink();
    } else if (route == Routes.promptBills) {
      return const PromptBillsAppBar();
    } else if (route.contains('bill')) {
      return const BillFlowAppBar();
    }
    return const HomeAppBar();
  }
}
