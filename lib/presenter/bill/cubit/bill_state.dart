part of 'bill_cubit.dart';

class BillState extends BaseState with EquatableMixin {
  BillState({
    required super.status,
    super.callbackMessage,
    BillModel? newBill,
    bool? isEditionFlow,
  })  : bill = newBill ?? BillModel(),
        isEditionFlow = isEditionFlow ?? false;

  final BillModel bill;
  final bool isEditionFlow;

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        bill,
        isEditionFlow,
      ];

  @override
  BillState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    bool? isEditionFlow,
    BillModel? bill,
  }) =>
      BillState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        newBill: bill ?? this.bill,
        isEditionFlow: isEditionFlow ?? this.isEditionFlow,
      );
}
