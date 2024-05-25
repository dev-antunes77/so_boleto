part of 'bill_cubit.dart';

class BillState extends BaseState with EquatableMixin {
  BillState({
    required super.status,
    super.callbackMessage,
    required this.bills,
    BillModel? newBill,
  }) : newBill = newBill ?? BillModel();

  final List<BillModel> bills;
  final BillModel newBill;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        bills,
        newBill,
      ];

  @override
  BillState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<BillModel>? bills,
    UserModel? user,
    BillModel? newBill,
  }) =>
      BillState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bills: bills ?? this.bills,
        newBill: newBill ?? this.newBill,
      );
}
