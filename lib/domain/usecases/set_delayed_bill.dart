import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';

final class SetDelayedBill {
  SetDelayedBill();

  void call(List<BillModel> bills) {
    try {
      final date = AppConstants.currentDate;
      for (var bill in bills) {
        if (bill.dueDay < date.day && !bill.isMonthPayed()) {
          bill.updateBillPayment(date, BillStatus.delayed);
          final updatedBill = bill.copyWith();
          bills.insert(bills.indexOf(bill), updatedBill);
          bills.remove(bill);
        }
      }
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
