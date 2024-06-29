import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/list_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/filter_params.dart';
import 'package:so_boleto/domain/models/prompt_bill.dart';
import 'package:so_boleto/domain/models/user_data.dart';
import 'package:so_boleto/domain/usecases/add_prompt_bills.dart';
import 'package:so_boleto/domain/usecases/create_bill.dart';
import 'package:so_boleto/domain/usecases/delete_bill.dart';
import 'package:so_boleto/domain/usecases/edit_bill.dart';
import 'package:so_boleto/domain/usecases/filter_bills_by_params.dart';
import 'package:so_boleto/domain/usecases/get_bills.dart';
import 'package:so_boleto/domain/usecases/set_bill_as_paid.dart';

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

  final GetBills _getBillsUseCase;
  final CreateBill _createBillUseCase;
  final DeleteBill _deleteBillUseCase;
  final EditBill _editBillUseCase;
  final SetBillAsPaid _setBillAsPaidUseCase;
  final FilterBillsByParams _filterBillsByParamsUseCase;
  final AddPromptBills _addPromptBillsUsecase;

  Future<void> onInit(UserData user) async {
    try {
      if (state.bills.isNotEmpty) return;

      emit(state.copyWith(status: BaseStateStatus.loading));
      // Future.delayed(const Duration(seconds: 10)).then((_) async {
      final updatedBills = await _getBillsUseCase(user.id);
      emit(
        state.copyWith(
          status: BaseStateStatus.success,
          bills: updatedBills,
          user: user,
        ),
      );
      // });
    } on AppError catch (error) {
      onAppError(error);
      emit(
        state.copyWith(status: BaseStateStatus.generalError),
      );
    }
  }

  Future<void> createBill(BillModel bill) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final userBoundedBill = bill.copyWith(userId: state.user.id);
      await _createBillUseCase(userBoundedBill);
      await _updateBills();
    } on AppError catch (_) {
      _handleErrorEmit(AppLocalizations.current.homeBillCreationError);
    }
  }

  Future<void> _updateBills() async {
    final updatedBills = await _getBillsUseCase(state.user.id);
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        bills: updatedBills,
      ),
    );
  }

  bool _handleErrorEmit(String message) {
    emit(
      state.copyWith(
        status: BaseStateStatus.focusedError,
        callbackMessage: message,
      ),
    );
    return false;
  }

  Future<void> editBill(BillModel bill) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _editBillUseCase(bill);
      await _updateBills();
    } on AppError catch (_) {
      _handleErrorEmit(AppLocalizations.current.homeBillEditionError);
    }
  }

  Future<bool> setBillAsPaid(BillModel bill) async {
    try {
      if (bill.billStatus == BillStatus.payed) return false;
      emit(state.copyWith(status: BaseStateStatus.loading));
      await _setBillAsPaidUseCase(bill);
      await _updateBills();
      return false;
    } on AppError catch (_) {
      return _handleErrorEmit(AppLocalizations.current.homeBillActionError);
    }
  }

  Future<bool> deleteBill(String billId) async {
    try {
      emit(state.copyWith(status: BaseStateStatus.loading));
      final hasDeleted = await _deleteBillUseCase(state.user.id, billId);
      if (hasDeleted) {
        await _updateBills();
        return true;
      }
      return _handleErrorEmit(AppLocalizations.current.homeBillActionError);
    } on AppError catch (_) {
      return _handleErrorEmit(AppLocalizations.current.homeBillActionError);
    }
  }

  /// setting value to empty closes search by name flow
  void setSearchByNameValue(String query) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        querySearch: query,
      ),
    );
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
      await _addPromptBillsUsecase(state.user.id, promptBills);
      await _updateBills();
    } on AppError catch (error) {
      onAppError(error);
      emit(
        state.copyWith(
          status: BaseStateStatus.generalError,
        ),
      );
    }
  }
}
