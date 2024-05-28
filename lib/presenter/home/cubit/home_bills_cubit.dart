import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/create_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/delete_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/get_bills_usecase.dart';
import 'package:so_boleto/domain/usecases/set_bill_as_paid_usecase.dart';

part 'home_bills_state.dart';

class HomeBillsCubit extends Cubit<HomeBillsState> with BaseCubit {
  HomeBillsCubit(
    this._getBillsUseCase,
    this._createBillUseCase,
    this._setBillAsPaidUseCase,
    this._deleteBillUseCase,
  ) : super(HomeBillsState(
            status: BaseStateStatus.initial, bills: List.empty()));

  final GetBillsUseCase _getBillsUseCase;
  final CreateBillUseCase _createBillUseCase;
  final DeleteBillUseCase _deleteBillUseCase;
  final SetBillAsPaidUseCase _setBillAsPaidUseCase;

  Future<void> getBills() async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final updatedBills = await _getBillsUseCase();
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

  Future<void> createBill(BillModel bill) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _createBillUseCase(bill);
      await getBills();
    } on AppError catch (error) {
      onAppError(error);
      emit(
        state.copyWith(
          status: BaseStateStatus.error,
        ),
      );
    }
  }

  Future<bool> setBillAsPaid(BillModel bill) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _setBillAsPaidUseCase(bill);
      await getBills();
      return true;
    } on AppError catch (error) {
      onAppError(error);
      emit(
        state.copyWith(
          status: BaseStateStatus.error,
        ),
      );
    }
    return false;
  }

  Future<void> deleteBill(String id) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _deleteBillUseCase(id);
      await getBills();
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
