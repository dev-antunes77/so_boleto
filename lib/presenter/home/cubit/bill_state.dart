part of 'bill_cubit.dart';

class BillState extends BaseState with EquatableMixin {
  BillState({
    required super.status,
    super.callbackMessage,
    required this.bill,
  });

  final List<BillModel> bill;

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
    List<BillModel>? bill,
    UserModel? user,
  }) =>
      BillState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bill: bill ?? this.bill,
      );
}
