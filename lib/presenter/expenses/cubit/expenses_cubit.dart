import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/usecases/expense_three_to_nine_months.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> with BaseCubit {
  ExpensesCubit(
    this._expenseThreeToNineMonths,
  ) : super(ExpensesState(status: BaseStateStatus.initial));

  final ExpenseThreeToNineMonths _expenseThreeToNineMonths;

  void onInit(List<BillModel> allBills) {
    final expenses = _expenseThreeToNineMonths(allBills);

    emit(
      state.copyWith(
        totalExpensesThisMonth: expenses.thisMonthExpenses,
        totalExpensesLast3Months: expenses.threeMonthExpenses,
        totalExpensesLast6Months: expenses.sixMonthExpenses,
        totalExpensesLast9Months: expenses.nineMonthExpenses,
        status: BaseStateStatus.success,
      ),
    );
  }
}
