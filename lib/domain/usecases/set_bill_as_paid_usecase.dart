import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bills_database.dart';

final class SetBillAsPaidUseCase {
  SetBillAsPaidUseCase(this._hiveBillsDatabase);

  final HiveBillsDatabase _hiveBillsDatabase;

  Future<void> call(BillModel bill) async {
    try {
      final hasParcels = bill.totalParcels > 1 && !bill.dueEveryMonth;
      final parcelPaid = hasParcels ? bill.payedParcels + 1 : null;
      final paidBill =
          bill.copyWith(billState: BillState.payed, payedParcels: parcelPaid);
      await _hiveBillsDatabase.updateBill(paidBill);
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
