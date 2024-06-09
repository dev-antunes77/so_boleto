import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/list_extensions.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/domain/models/filter_params.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/domain/models/user.dart';
import 'package:so_boleto/domain/usecases/add_prompt_bills_usecase.dart';
import 'package:so_boleto/domain/usecases/create_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/delete_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/edit_bill_usecase.dart';
import 'package:so_boleto/domain/usecases/filter_bills_by_params.dart';
import 'package:so_boleto/domain/usecases/get_bills_usecase.dart';
import 'package:so_boleto/domain/usecases/set_bill_as_paid_usecase.dart';

part 'home_bills_state.dart';

class HomeBillsCubit extends Cubit<HomeBillsState> with BaseCubit {
  HomeBillsCubit(
    this._getBillsUseCase,
    this._createBillUseCase,
    this._setBillAsPaidUseCase,
    this._deleteBillUseCase,
    this._editBillUseCase,
    this._filterBillsByParamsUseCase,
    this._addPromptBillsUsecase,
  ) : super(HomeBillsState(status: BaseStateStatus.initial));

  final GetBillsUseCase _getBillsUseCase;
  final CreateBillUseCase _createBillUseCase;
  final DeleteBillUseCase _deleteBillUseCase;
  final EditBillUseCase _editBillUseCase;
  final SetBillAsPaidUseCase _setBillAsPaidUseCase;
  final FilterBillsByParamsUseCase _filterBillsByParamsUseCase;
  final AddPromptBillsUsecase _addPromptBillsUsecase;

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

  Future<void> editBill(BillModel bill) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _editBillUseCase(bill);
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
      if (bill.billStatus == BillStatus.payed) return false;
      // emit(state.copyWith(status: BaseStateStatus.loading));
      await _setBillAsPaidUseCase(bill);
      await getBills();
      return false;
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

  /// setting value to empty closes search by name flow
  void setSearchByNameValue(String query) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(state.copyWith(querySearch: query, status: BaseStateStatus.success));
  }

  void setFilterParams(FilterParams params) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    final filteredBills = _filterBillsByParamsUseCase(state.bills, params);
    emit(
      state.copyWith(
        filteredByParams: filteredBills,
        paramsApplied: true,
        status: BaseStateStatus.success,
      ),
    );
  }

  void removeFilterParams() {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(
      state.copyWith(
        filteredByParams: [],
        paramsApplied: false,
        status: BaseStateStatus.success,
      ),
    );
  }

  void addPrompBills(List<PromptBill> promptBills) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _addPromptBillsUsecase(promptBills);
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
