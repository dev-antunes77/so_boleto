// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'expenses_cubit.dart';

class ExpensesState extends BaseState with EquatableMixin {
  ExpensesState({
    required super.status,
    super.callbackMessage,
    int? totalExpenses,
    int? totalExpensesLast3Months,
    int? totalExpensesLast6Months,
    int? totalExpensesLast9Months,
  })  : totalExpensesThisMonth = totalExpenses ?? 0,
        totalExpensesLast3Months = totalExpensesLast3Months ?? 0,
        totalExpensesLast6Months = totalExpensesLast6Months ?? 0,
        totalExpensesLast9Months = totalExpensesLast9Months ?? 0;

  final int totalExpensesThisMonth;
  final int totalExpensesLast3Months;
  final int totalExpensesLast6Months;
  final int totalExpensesLast9Months;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      totalExpensesThisMonth,
      totalExpensesLast3Months,
      totalExpensesLast6Months,
      totalExpensesLast9Months,
    ];
  }

  @override
  ExpensesState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    int? totalExpensesThisMonth,
    int? totalExpensesLast3Months,
    int? totalExpensesLast6Months,
    int? totalExpensesLast9Months,
  }) =>
      ExpensesState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        totalExpenses: totalExpensesThisMonth ?? this.totalExpensesThisMonth,
        totalExpensesLast3Months:
            totalExpensesLast3Months ?? this.totalExpensesLast3Months,
        totalExpensesLast6Months:
            totalExpensesLast6Months ?? this.totalExpensesLast6Months,
        totalExpensesLast9Months:
            totalExpensesLast9Months ?? this.totalExpensesLast9Months,
      );
}
