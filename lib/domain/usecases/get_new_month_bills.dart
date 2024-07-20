import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill_payment.dart';
import 'package:so_boleto/domain/repositories/firestore_repository.dart';

final class GetNewMonthBills {
  GetNewMonthBills(this._firestoreRepository);

  final FirestoreRepository _firestoreRepository;

  Future<void> call(String userId) async {
    try {
      final bills = await _firestoreRepository.getBills(userId);
      for (var bill in bills) {
        while (AppConstants.currentDate.month >
            bill.billPayment.last.referredMonth.month) {
          var newPayment = BillPayment();
          newPayment = BillPayment(
            referredMonth: bill.billPayment.last.referredMonth
                .changeMonth(isAddition: true),
          );
          bill.billPayment.insert(bill.billPayment.length, newPayment);
          await _firestoreRepository.editBill(bill);
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
