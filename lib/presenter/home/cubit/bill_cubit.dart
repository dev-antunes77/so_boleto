import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/category.dart';
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

  void onBillNameChange(String billName) {
    emit(state.copyWith(newBill: state.newBill.copyWith(name: billName)));
  }

  void onBillDescriptionChange(String billDescription) {
    emit(state.copyWith(
        newBill: state.newBill.copyWith(description: billDescription)));
  }

  void onBillValueChange(String billValue) {
    emit(state.copyWith(status: BaseStateStatus.loading));

    RegExp regex = RegExp(r'[^0-9]');
    String result = billValue.replaceAll(regex, '');
    if (result.isEmpty) return;
    final numValue = int.parse(result);
    emit(state.copyWith(
        status: BaseStateStatus.success,
        newBill: state.newBill.copyWith(value: numValue)));
  }

  /// Sets parcels back to one
  void onBillMonthlyChange(bool dueEveryMonth) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(state.copyWith(
        status: BaseStateStatus.success,
        newBill: state.newBill
            .copyWith(totalParcels: 1, dueEveryMonth: dueEveryMonth)));
  }

  void onBillParcelsChange(int billParcels) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(state.copyWith(
        status: BaseStateStatus.success,
        newBill: state.newBill.copyWith(totalParcels: billParcels)));
  }

  void onBillCategoryChange(Category billCategory) {
    emit(state.copyWith(
        status: BaseStateStatus.loading,
        newBill: state.newBill.copyWith(category: billCategory)));
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  void onBillDueeDayOfTheMonthChange(int billDueDate) {
    emit(state.copyWith(
        status: BaseStateStatus.loading,
        newBill: state.newBill.copyWith(dueDayOfTheMonth: billDueDate)));
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  Future<void> createBill(BillModel bill) async {}

  void onSaveBill() {}
}
