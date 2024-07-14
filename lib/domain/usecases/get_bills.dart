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
      final sortedBills = _billSorting(bills, billSorting, isInverted);
      _setDelayedBill(sortedBills);
      return bills;
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }

  List<BillModel> _billSorting(
      List<BillModel> bills, BillSorting billSorting, bool isInverted) {
    List<BillModel> sortedBills = [];
    if (billSorting.byName) {
      isInverted
          ? bills.sort((a, b) => b.name.compareTo(a.name))
          : bills.sort((a, b) => a.name.compareTo(b.name));
      sortedBills = bills;
    } else if (billSorting.byDueDay) {
      isInverted
          ? bills.sort((a, b) => b.dueDay.compareTo(a.dueDay))
          : bills.sort((a, b) => a.dueDay.compareTo(b.dueDay));
      sortedBills = bills;
    } else if (billSorting.byValue) {
      isInverted
          ? bills.sort((a, b) => b.value.compareTo(a.value))
          : bills.sort((a, b) => a.value.compareTo(b.value));
      sortedBills = bills;
    } else {
      bills.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      sortedBills = bills;
    }
    return sortedBills;
  }

  void _setDelayedBill(List<BillModel> bills) {
    final date = DateTime.now();
    for (var bill in bills) {
      if (bill.dueDay < date.day && !bill.isMonthPayed()) {
        bill.updateBillPayment(date, BillStatus.delayed);
        final updatedBill = bill.copyWith();
        bills.insert(bills.indexOf(bill), updatedBill);
        bills.remove(bill);
      }
    }
  }
}
