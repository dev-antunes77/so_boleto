import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/extensions/string_extensions.dart';
import 'package:so_boleto/core/utils/base_cubit.dart';
import 'package:so_boleto/core/utils/base_state.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';

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

    final numValue = billValue.revertCurrencyFormat();
    emit(state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(value: numValue)));
  }

  /// Sets parcels back to one
  void onBillMonthlyChange(bool dueEveryMonth) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(
          totalParcels: 1,
        ),
      ),
    );
  }

  void onBillParcelsChange({required int billParcels}) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(totalParcels: billParcels)));
  }

  void onBillCategoryChange(BillCategory billCategory) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(category: billCategory),
      ),
    );
  }

  void onBillDueeDayOfTheMonthChange(int billDueDate) {
    emit(state.copyWith(status: BaseStateStatus.loading));
    emit(
      state.copyWith(
        status: BaseStateStatus.success,
        bill: state.bill.copyWith(dueDay: billDueDate.nonZero()),
      ),
    );
  }

  BillModel onBillPayed(bool payed, bool isEditionFlow) {
    var newStatus = BillStatus.payed;
    if (!payed) {
      newStatus = state.bill.dueDay < AppConstants.currentDate.day
          ? BillStatus.delayed
          : BillStatus.open;
    }
    //TODO remove the teste date
    final date = DateTime.now();
    state.bill.updateBillPayment(date, newStatus);
    final newPayments = state.bill.billPayment;
    final payedParcels = state.bill.payedParcels;
    final updatedPayedParcels =
        payed ? payedParcels + 1 : payedParcels.nonZero() - 1;
    return state.bill.copyWith(
      billPayment: newPayments,
      payedParcels: updatedPayedParcels,
    );
  }

  void initiateEditionFlow({BillModel? bill}) =>
      emit(state.copyWith(bill: bill, isEditionFlow: true));

  void initiateCreationFlow(String userId) => emit(
      state.copyWith(bill: BillModel(userId: userId), isEditionFlow: false));
}
