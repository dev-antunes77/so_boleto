import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/presenter/bill/widgets/bill_flow_app_bar.dart';
import 'package:so_boleto/presenter/expenses/widgets/expenses_app_bar.dart';
import 'package:so_boleto/presenter/home/widgets/home_app_bar.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_options_app_bar.dart';
import 'package:so_boleto/presenter/prompt_bills/widgets/promot_bills_edition_app_bar.dart';
import 'package:so_boleto/presenter/prompt_bills/widgets/prompt_bills_app_bar.dart';

class AppBarHandler extends StatelessWidget {
  const AppBarHandler(this.route, {super.key});
  final String route;

  @override
  Widget build(BuildContext context) {
    switch (route) {
      case Routes.home:
        return const HomeAppBar();
      case Routes.expenses:
        return const ExpensesAppBar();
      case Routes.promptBills:
        return const PromptBillsAppBar();
      case Routes.promptBillsEdition:
        return const PromptBillsEditionAppBar();
      case Routes.billCategory:
      case Routes.billCheck:
      case Routes.billName:
      case Routes.billDueDay:
      case Routes.billParcels:
      case Routes.billValue:
        return const BillFlowAppBar();
      case Routes.profile:
        return const ProfileOptionsAppBar();
      case Routes.profileTheme:
      case Routes.profileDueDay:
      case Routes.profilePayedTag:
      case Routes.profileSecurity:
      case Routes.profileViewPicture:
        return const ProfileOptionsAppBar();
    }
    throw Exception();
  }
}
