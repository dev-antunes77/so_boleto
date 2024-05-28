import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/category.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> with BaseCubit {
  BillCubit() : super(BillState(status: BaseStateStatus.initial));

  void onBillNameChange(String billName) {
    emit(state.copyWith(bill: state.bill.copyWith(name: billName)));
  }

  void onBillDescriptionChange(String billDescription) {
    emit(state.copyWith(
        bill: state.bill.copyWith(description: billDescription)));
  }

  void onBillValueChange(String billValue) {
    emit(state.copyWith(status: BaseStateStatus.loading));

    RegExp regex = RegExp(r'[^0-9]');
    String result = billValue.replaceAll(regex, '');
    if (result.isEmpty) return;
    final numValue = int.parse(result);
    emit(state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(value: numValue)));
  }

  /// Sets parcels back to one
  void onBillMonthlyChange(bool dueEveryMonth) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill
            .copyWith(totalParcels: 1, dueEveryMonth: dueEveryMonth)));
  }

  void onBillParcelsChange(int billParcels) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(totalParcels: billParcels)));
  }

  void onBillCategoryChange(Category billCategory) {
    emit(state.copyWith(
        status: BaseStateStatus.loading,
        bill: state.bill.copyWith(category: billCategory)));
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  void onBillDueeDayOfTheMonthChange(int billDueDate) {
    emit(state.copyWith(
        status: BaseStateStatus.loading,
        bill: state.bill.copyWith(dueDayOfTheMonth: billDueDate)));
    emit(state.copyWith(status: BaseStateStatus.success));
  }

  void resetBill() => emit(state.copyWith(bill: BillModel()));
}
