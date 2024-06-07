part of 'home_bills_cubit.dart';

class HomeBillsState extends BaseState with EquatableMixin {
  HomeBillsState({
    required super.status,
    super.callbackMessage,
    String? querySearch,
    List<BillModel>? bills,
    List<BillModel>? filterParams,
    bool? paramsApplied,
  })  : filteredByParams = filterParams ?? List.empty(),
        bills = bills ?? List.empty(),
        querySearch = querySearch ?? '',
        paramsApplied = paramsApplied ?? false;

  final List<BillModel> bills;
  final List<BillModel> filteredByParams;
  final String querySearch;
  final bool paramsApplied;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
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

  List<BillModel> get delayeddBills => allBills
      .where((element) => element.billStatus == BillStatus.delayed)
      .toList();

  List<BillModel> inFilteringCase(List<BillModel> bills) =>
      querySearch.isNotEmpty ? bills.filterBills(querySearch) : bills;

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
        filterParams: filteredByParams ?? this.filteredByParams,
        paramsApplied: paramsApplied ?? this.paramsApplied,
        querySearch: querySearch ?? this.querySearch,
      );
}
