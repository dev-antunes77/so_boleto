import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bills_database.dart';

final class EditBill {
  EditBill(
    this._hiveBillsDatabase,
    // this._firestoreRepository,
  );

  final HiveBillsDatabase _hiveBillsDatabase;
  // final FirestoreRepository _firestoreRepository;

  Future<void> call(BillModel bill) async {
    try {
      // await _hiveBillsDatabase.editBill(bill);
      // await _firestoreRepository.editBill(bill);
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }
}
