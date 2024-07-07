part of 'home_bills_cubit.dart';

class HomeBillsState extends BaseState with EquatableMixin {
  HomeBillsState({
    required super.status,
    super.callbackMessage,
    String? querySearch,
    List<BillModel>? bills,
    List<BillModel>? filterParams,
    bool? paramsApplied,
    String? userId,
    BillSorting? billSorting,
    bool? hasInvertedSorting,
  })  : userId = userId ?? '',
        filteredByParams = filterParams ?? List.empty(),
        bills = bills ?? List.empty(),
        querySearch = querySearch ?? '',
        billSorting = billSorting ?? BillSorting.date,
        hasInvertedSorting = hasInvertedSorting ?? false,
        paramsApplied = paramsApplied ?? false;

  final List<BillModel> bills;
  final List<BillModel> filteredByParams;
  final String querySearch;
  final bool paramsApplied;
  final bool hasInvertedSorting;
  final String userId;
  final BillSorting billSorting;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        bills,
        filteredByParams,
        querySearch,
        paramsApplied,
        hasInvertedSorting,
        billSorting,
        userId,
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

  List<BillModel> get payedBills =>
      allBills.where((element) => element.billStatus.isPayed).toList();

  List<BillModel> get delayedBills => allBills
      .where((element) => element.billStatus == BillStatus.delayed)
      .toList();

  List<BillModel> inFilteringCase(List<BillModel> bills) =>
      querySearch.isNotEmpty ? bills.filterBills(querySearch) : bills;

  int get totalExpensesPayed {
    int total = 0;
    for (var bill in allBills) {
      if (bill.billStatus.isPayed) {
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
    bool? hasInvertedSorting,
    BillSorting? billSorting,
    String? userId,
  }) =>
      HomeBillsState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bills: bills ?? this.bills,
        filterParams: filteredByParams ?? this.filteredByParams,
        querySearch: querySearch ?? this.querySearch,
        paramsApplied: paramsApplied ?? this.paramsApplied,
        billSorting: billSorting ?? this.billSorting,
        hasInvertedSorting: hasInvertedSorting ?? this.hasInvertedSorting,
        userId: userId ?? this.userId,
      );
}
