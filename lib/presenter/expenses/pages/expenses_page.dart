import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/custom_safe_area/custom_safe_area.dart';
import 'package:so_boleto/core/components/thin_line_separator/thin_line_separator.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/expenses/cubit/expenses_cubit.dart';
import 'package:so_boleto/presenter/expenses/widgets/expense_tile.dart';
import 'package:so_boleto/presenter/home/cubit/home_bills_cubit.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage>
    with TickerProviderStateMixin {
  late final ExpensesCubit cubit;
  @override
  void initState() {
    cubit = context.read<ExpensesCubit>();
    final homeBillState = context.read<HomeBillsCubit>().state;
    cubit.onInit(homeBillState.totalExpensesPayed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ExpensesTile(
            label: AppLocalizations.current.expensesForThisMonth,
            value: cubit.state.totalExpenses,
          ),
          LineSeparator.infiniteHorizon(),
          ExpensesTile(
            label: AppLocalizations.current.expensesForThreeMonth,
            value: cubit.state.totalExpensesLast3Months,
          ),
          LineSeparator.infiniteHorizon(),
          ExpensesTile(
            label: AppLocalizations.current.expensesForSixMonth,
            value: cubit.state.totalExpensesLast6Months,
          ),
          AppThemeValues.spaceVerticalHuge,
        ],
      ),
    );
  }
}
