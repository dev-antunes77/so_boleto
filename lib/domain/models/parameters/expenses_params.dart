final class ExpensesParams {
  const ExpensesParams({
    required this.thisMonthExpenses,
    required this.threeMonthExpenses,
    required this.sixMonthExpenses,
    required this.nineMonthExpenses,
  });

  final int thisMonthExpenses;
  final int threeMonthExpenses;
  final int sixMonthExpenses;
  final int nineMonthExpenses;
}
