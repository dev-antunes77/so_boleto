// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expenses_cubit.dart';

class ExpensesState extends BaseState with EquatableMixin {
  ExpensesState({
    required super.status,
    super.callbackMessage,
    int? totalExpenses,
  }) : totalExpenses = totalExpenses ?? 0;

  final int totalExpenses;

  @override
  List<Object> get props {
    return [
      callbackMessage,
      status,
      totalExpenses,
    ];
  }

  @override
  ExpensesState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    int? totalExpenses,
  }) =>
      ExpensesState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        totalExpenses: totalExpenses ?? this.totalExpenses,
      );
}
