part of 'home_bills_cubit.dart';

class HomeBillsState extends BaseState with EquatableMixin {
  HomeBillsState({
    required super.status,
    super.callbackMessage,
    required this.bills,
  });

  final List<BillModel> bills;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        bills,
      ];

  List<BillModel> get payedBills =>
      bills.where((element) => element.billState == BillState.payed).toList();

  List<BillModel> get delayeddBills =>
      bills.where((element) => element.billState == BillState.delayed).toList();

  @override
  HomeBillsState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<BillModel>? bills,
    UserModel? user,
  }) =>
      HomeBillsState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bills: bills ?? this.bills,
      );
}
