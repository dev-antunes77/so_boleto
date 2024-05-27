import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/get_bills_usecase.dart';

part 'home_bills_state.dart';

class HomeBillsCubit extends Cubit<HomeBillsState> with BaseCubit {
  HomeBillsCubit(this._getBillsUseCase)
      : super(HomeBillsState(
            status: BaseStateStatus.initial, bills: List.empty()));

  final GetBillsUseCase _getBillsUseCase;

  Future<List<BillModel>> getBills() async {
    try {
      return _getBillsUseCase();
    } on AppError catch (error) {
      onAppError(error);
      emit(
        state.copyWith(
          status: BaseStateStatus.error,
        ),
      );
    }
    return [];
  }

  Future<void> createBill(BillModel bill) async {
    try {
      final updatedBills = state.bills + [bill];
      emit(state.copyWith(status: BaseStateStatus.loading));
      emit(
          state.copyWith(status: BaseStateStatus.success, bills: updatedBills));
    } on AppError catch (error) {
      onAppError(error);
      emit(
        state.copyWith(
          status: BaseStateStatus.error,
        ),
      );
    }
  }
}
