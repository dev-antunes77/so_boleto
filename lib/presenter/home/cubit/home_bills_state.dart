part of 'home_bills_cubit.dart';

class HomeBillsState extends BaseState with EquatableMixin {
  HomeBillsState({
    required super.status,
    super.callbackMessage,
    UserModel? user,
    String? querySearch,
    List<BillModel>? bills,
    List<BillModel>? filterParams,
    bool? paramsApplied,
  })  : user = user ?? UserModel(),
        filteredByParams = filterParams ?? List.empty(),
        bills = bills ?? List.empty(),
        querySearch = querySearch ?? '',
        paramsApplied = paramsApplied ?? false;

  final UserModel user;
  final List<BillModel> bills;
  final List<BillModel> filteredByParams;
  final String querySearch;
  final bool paramsApplied;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        user,
        bills,
        filteredByParams,
        querySearch,
        paramsApplied,
      ];

  List<BillModel> get allBills => paramsApplied
      ? bills
          .where(
            (element) => filteredByParams.any(
              (filtered) => filtered.id == element.id,
            ),
          )
          .toList()
      : bills;

  List<BillModel> get payedBills => allBills
      .where((element) => element.billStatus == BillStatus.payed)
      .toList();

  List<BillModel> get delayedBills => allBills
      .where((element) => element.billStatus == BillStatus.delayed)
      .toList();

  List<BillModel> inFilteringCase(List<BillModel> bills) =>
      querySearch.isNotEmpty ? bills.filterBills(querySearch) : bills;

  int get totalExpensesPayed {
    int total = 0;
    for (var bill in allBills) {
      if (bill.billStatus == BillStatus.payed) {
        total += bill.value;
      }
    }
    return total;
  }

  int get totalExpensesUnpayed {
    int total = 0;
    for (var bill in allBills) {
      if (bill.billStatus == BillStatus.open ||
          bill.billStatus == BillStatus.delayed) {
        total += bill.value;
      }
    }
    return total;
  }

  @override
  HomeBillsState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<BillModel>? bills,
    List<BillModel>? filteredByParams,
    String? querySearch,
    bool? paramsApplied,
    UserModel? user,
  }) =>
      HomeBillsState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bills: bills ?? this.bills,
        user: user ?? this.user,
        filterParams: filteredByParams ?? this.filteredByParams,
        querySearch: querySearch ?? this.querySearch,
        paramsApplied: paramsApplied ?? this.paramsApplied,
      );
}
