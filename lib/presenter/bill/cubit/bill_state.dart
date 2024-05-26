part of 'bill_cubit.dart';

class BillState extends BaseState with EquatableMixin {
  BillState({
    required super.status,
    super.callbackMessage,
    BillModel? newBill,
  }) : bill = newBill ?? BillModel();

  final BillModel bill;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        bill,
      ];

  @override
  BillState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    bool? isEditingFlow,
    bool? isEditionPage,
    BillModel? bill,
  }) =>
      BillState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        newBill: bill ?? this.bill,
      );
}
