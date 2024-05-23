import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/get_bills_usecase.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> with BaseCubit {
  BillCubit(this._getBillsUseCase)
      : super(BillState(status: BaseStateStatus.initial, bills: List.empty()));

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

  Future<void> createBill(BillModel bill) async {}

  void onSaveBill() {}
}
