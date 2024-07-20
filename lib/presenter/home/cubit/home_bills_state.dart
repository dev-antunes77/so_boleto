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
    DateTime? currentMonth,
  })  : userId = userId ?? '',
        filteredByParams = filterParams ?? List.empty(),
        bills = bills ?? List.empty(),
        querySearch = querySearch ?? '',
        billSorting = billSorting ?? BillSorting.date,
        hasInvertedSorting = hasInvertedSorting ?? false,
        paramsApplied = paramsApplied ?? false,
        currentMonth = currentMonth ?? AppConstants.currentDate;

  final List<BillModel> bills;
  final List<BillModel> filteredByParams;
  final String querySearch;
  final bool paramsApplied;
  final bool hasInvertedSorting;
  final String userId;
  final BillSorting billSorting;
  final DateTime currentMonth;

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
        currentMonth,
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
      allBills.where((element) => element.isMonthPayed()).toList();

  List<BillModel> get delayedBills =>
      allBills.where((element) => element.isMonthDelayed()).toList();

  List<BillModel> get parceledBills =>
      allBills.where((element) => element.totalParcels > 1).toList();

  List<BillModel> getOldBills(DateTime oldMonth) {
    List<BillModel> bills = [];
    for (var bill in allBills) {
      if (bill.checkReferredMonth(oldMonth)) {
        bills.add(bill);
      }
    }
    return bills;
  }

  List<BillModel> getPayedOldBills(DateTime oldMonth) => getOldBills(oldMonth)
      .where((element) => element.isMonthPayed(date: oldMonth))
      .toList();

  List<BillModel> getDelayedOldBills(DateTime oldMonth) => getOldBills(oldMonth)
      .where((element) => element.isMonthDelayed(date: oldMonth))
      .toList();

  List<BillModel> get futureBills {
    List<BillModel> bills = [];
    for (var bill in allBills) {
      if (bill.totalParcels > 1) {
        if (bill.parcelsLeft > bill.billPayment.length) {
          bills.add(bill);
        }
      }
    }
    return bills;
  }

  List<BillModel> inFilteringCase(List<BillModel> bills) =>
      querySearch.isNotEmpty ? bills.filterBills(querySearch) : bills;

  int get totalExpensesPayed {
    int total = 0;
    for (var bill in allBills) {
      for (var payment in bill.billPayment) {
        if (payment.billStatus.isPayed) {
          total += bill.value;
        }
      }
    }
    return total;
  }

  int get totalExpensesUnpayed {
    int total = 0;
    for (var bill in allBills) {
      for (var payment in bill.billPayment) {
        if (payment.billStatus == BillStatus.open ||
            payment.billStatus == BillStatus.delayed) {
          total += bill.value;
        }
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
    DateTime? currentMonth,
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
        currentMonth: currentMonth ?? this.currentMonth,
        hasInvertedSorting: hasInvertedSorting ?? this.hasInvertedSorting,
        userId: userId ?? this.userId,
      );
}
