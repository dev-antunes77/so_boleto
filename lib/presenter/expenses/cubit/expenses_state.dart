// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expenses_cubit.dart';

class ExpensesState extends BaseState with EquatableMixin {
  ExpensesState({
    required super.status,
    super.callbackMessage,
    int? totalExpenses,
    int? totalExpensesLast3Months,
    int? totalExpensesLast6Months,
    int? totalExpensesLast9Months,
  })  : totalExpenses = totalExpenses ?? 0,
        totalExpensesLast3Months = totalExpensesLast3Months ?? 0,
        totalExpensesLast6Months = totalExpensesLast6Months ?? 0,
        totalExpensesLast9Months = totalExpensesLast9Months ?? 0;

  final int totalExpenses;
  final int totalExpensesLast3Months;
  final int totalExpensesLast6Months;
  final int totalExpensesLast9Months;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      totalExpenses,
      totalExpensesLast3Months,
      totalExpensesLast6Months,
      totalExpensesLast9Months,
    ];
  }

  @override
  ExpensesState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    int? totalExpenses,
    int? totalExpensesLast3Months,
    int? totalExpensesLast6Months,
    int? totalExpensesLast9Months,
  }) =>
      ExpensesState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        totalExpenses: totalExpenses ?? this.totalExpenses,
        totalExpensesLast3Months:
            totalExpensesLast3Months ?? this.totalExpensesLast3Months,
        totalExpensesLast6Months:
            totalExpensesLast6Months ?? this.totalExpensesLast6Months,
        totalExpensesLast9Months:
            totalExpensesLast9Months ?? this.totalExpensesLast9Months,
      );
}
