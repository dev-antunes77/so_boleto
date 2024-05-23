part of 'bill_cubit.dart';

class BillState extends BaseState with EquatableMixin {
  BillState({
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

  @override
  BillState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<BillModel>? bills,
    UserModel? user,
  }) =>
      BillState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        bills: bills ?? this.bills,
      );
}
