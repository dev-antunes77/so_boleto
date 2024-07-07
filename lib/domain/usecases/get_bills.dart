import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/enums/bill_sorting.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';
import 'package:so_boleto/infra/local_database/hive_bill_database/hive_bills_database.dart';

final class GetBills {
  GetBills(this._hiveBillsDatabase, this._firestoreRepository);

  final HiveBillsDatabase _hiveBillsDatabase;
  final FirestoreRepository _firestoreRepository;

  Future<List<BillModel>> call(String userId, BillSorting billSorting,
      {required bool isInverted}) async {
    try {
      // final bills = await _hiveBillsDatabase.getBills();
      final bills = await _firestoreRepository.getBills(userId);
      _billSorting(bills, billSorting, isInverted);
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

  void _billSorting(
      List<BillModel> bills, BillSorting billSorting, bool isInverted) {
    if (billSorting.byName) {
      isInverted
          ? bills.sort((a, b) => b.name.compareTo(a.name))
          : bills.sort((a, b) => a.name.compareTo(b.name));
    } else if (billSorting.byDueDay) {
      isInverted
          ? bills.sort((a, b) => b.dueDay.compareTo(a.dueDay))
          : bills.sort((a, b) => a.dueDay.compareTo(b.dueDay));
    } else if (billSorting.byValue) {
      isInverted
          ? bills.sort((a, b) => b.value.compareTo(a.value))
          : bills.sort((a, b) => a.value.compareTo(b.value));
    } else {
      bills.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
  }

  void _setDelayedBill(List<BillModel> bills) {
    final today = DateTime.now().day;
    for (var bill in bills) {
      if (bill.dueDay < today && bill.billStatus != BillStatus.payed) {
        final updatedBill = bill.copyWith(billStatus: BillStatus.delayed);
        bills.insert(bills.indexOf(bill), updatedBill);
        bills.remove(bill);
      }
    }
  }
}
