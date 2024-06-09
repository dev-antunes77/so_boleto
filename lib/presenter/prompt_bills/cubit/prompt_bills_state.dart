part of 'prompt_bills_cubit.dart';

class PromptBillsState extends BaseState with EquatableMixin {
  PromptBillsState({
    required super.status,
    super.callbackMessage,
    List<PromptBill>? promptBills,
    int? howManySelectd,
  })  : promptBills = promptBills ?? [],
        howManySelectd = howManySelectd ?? 0;

  final List<PromptBill> promptBills;
  final int howManySelectd;

  bool get hasAnySelected => promptBills.any((element) => element.isSelected);

  bool get allSelected => promptBills.length == howManySelectd;

  List<PromptBill> get selectedPromptBills =>
      promptBills.where((element) => element.isSelected).toList();

  bool get editionNotValid =>
      selectedPromptBills.any((element) => element.value <= 0);

  @override
  List<Object?> get props => [
        status,
        callbackMessage,
        promptBills,
        howManySelectd,
      ];

  @override
  PromptBillsState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
    List<PromptBill>? promptBills,
    int? howManySelectd,
  }) =>
      PromptBillsState(
        status: status ?? this.status,
        callbackMessage: callbackMessage ?? this.callbackMessage,
        promptBills: promptBills ?? this.promptBills,
        howManySelectd: howManySelectd ?? this.howManySelectd,
      );
}
