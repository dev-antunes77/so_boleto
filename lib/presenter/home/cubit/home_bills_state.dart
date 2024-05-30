part of 'home_bills_cubit.dart';

class HomeBillsState extends BaseState with EquatableMixin {
  HomeBillsState({
    required super.status,
    required this.querySearch,
    super.callbackMessage,
    required this.bills,
  });

  final List<BillModel> bills;
  final String querySearch;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        bills,
        querySearch,
      ];

  List<BillModel> get payedBills =>
      bills.where((element) => element.billStatus == BillStatus.payed).toList();

  List<BillModel> get delayeddBills => bills
      .where((element) => element.billStatus == BillStatus.delayed)
      .toList();

  List<BillModel> inFilteringCase(List<BillModel> bills) =>
      querySearch.isNotEmpty ? bills.filterBills(querySearch) : bills;

  @override
  HomeBillsState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<BillModel>? bills,
    String? querySearch,
    UserModel? user,
  }) =>
      HomeBillsState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bills: bills ?? this.bills,
        querySearch: querySearch ?? this.querySearch,
      );
}
