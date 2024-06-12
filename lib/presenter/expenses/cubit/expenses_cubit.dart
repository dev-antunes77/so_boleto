import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> with BaseCubit {
  ExpensesCubit() : super(ExpensesState(status: BaseStateStatus.initial));

  void onInit(int thisMonth) {
    emit(
      state.copyWith(
        totalExpenses: thisMonth,
        status: BaseStateStatus.success,
      ),
    );
  }
}
