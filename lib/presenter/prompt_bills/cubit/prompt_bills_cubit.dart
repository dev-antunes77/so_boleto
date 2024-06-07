import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/database/prompt_bill_data/prompt_bill_data.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';

part 'prompt_bills_state.dart';

class PromptBillsCubit extends Cubit<PromptBillsState> with BaseCubit {
  PromptBillsCubit() : super(PromptBillsState(status: BaseStateStatus.initial));

  onInit() {
    emit(state.copyWith(status: BaseStateStatus.initial));
    final promptBills = [...PromptBillData.promptBills];
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        promptBills: promptBills,
      ),
    );
  }

  onCardClicked(PromptBill promptBill) {
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

  handleAllBillsAtOnce({required bool select}) {
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
}
