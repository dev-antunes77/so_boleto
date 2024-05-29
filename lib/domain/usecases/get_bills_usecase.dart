import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bills_database.dart';

final class GetBillsUseCase {
  GetBillsUseCase(this._hiveBillsDatabase);

  final HiveBillsDatabase _hiveBillsDatabase;

  Future<List<BillModel>> call() async {
    try {
      final bills = await _hiveBillsDatabase.getBills();
      _setDelayedBill(bills);
      return bills;
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }

  void _setDelayedBill(List<BillModel> bills) {
    final today = DateTime.now().day;
    for (var bill in bills) {
      if (bill.dueDayOfTheMonth < today) {
        final updatedBill = bill.copyWith(billStatus: BillStatus.delayed);
        bills.insert(bills.indexOf(bill), updatedBill);
        bills.remove(bill);
      }
    }
  }
}
