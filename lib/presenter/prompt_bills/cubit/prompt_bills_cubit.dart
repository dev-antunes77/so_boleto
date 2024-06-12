// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/database/prompt_bill_data/prompt_bill_data.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';

part 'prompt_bills_state.dart';

class PromptBillsCubit extends Cubit<PromptBillsState> with BaseCubit {
  PromptBillsCubit() : super(PromptBillsState(status: BaseStateStatus.initial));

  void onInit(List<BillModel> homeBills) {
    emit(state.copyWith(status: BaseStateStatus.initial));
    final promptBills = [...PromptBillData.promptBills];
    promptBills.forEach((element) => element.isSelected = false);
    promptBills.removeWhere(
      (element) => homeBills.any((bill) => bill.id == element.id),
    );
    promptBills.shuffle();
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        promptBills: promptBills,
        howManySelectd: 0,
      ),
    );
  }

  void onCardClicked(PromptBill promptBill) {
    int selected = 0;
    for (var bill in state.promptBills) {
      if (bill.id == promptBill.id) {
        bill.isSelected = !bill.isSelected;
      }
      if (bill.isSelected) {
        selected++;
      }
    }
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        promptBills: state.promptBills,
        howManySelectd: selected,
      ),
    );
  }

  void handleAllBillsAtOnce({required bool select}) {
    for (var bill in state.promptBills) {
      bill.isSelected = select;
    }
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        promptBills: state.promptBills,
        howManySelectd: select ? state.promptBills.length : 0,
      ),
    );
  }

  List<PromptBill> onPrompBillsSelected() =>
      state.promptBills.where((element) => element.isSelected).toList();

  void onEditionInit() {
    for (var promptBill in state.selectedPromptBills) {
      promptBill.dueDay = 1;
      promptBill.value = 0;
    }
  }

  void onValueEdition(String id, int value) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    for (var bill in state.selectedPromptBills) {
      if (bill.id == id) {
        bill.value = value;
      }
    }
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        promptBills: state.promptBills,
      ),
    );
  }

  void onDueDayEdition(String id, int dueDay) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    for (var bill in state.selectedPromptBills) {
      if (bill.id == id) {
        bill.dueDay = dueDay;
      }
    }
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        promptBills: state.promptBills,
      ),
    );
  }
}
