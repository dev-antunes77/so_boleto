import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/errors/app_errors.dart';
import 'package:so_boleto/core/extensions/date_time_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/utils/log_utils.dart';
import 'package:so_boleto/domain/models/bill.dart';
import 'package:so_boleto/domain/models/parameters/expenses_params.dart';

final class ExpenseThreeToNineMonths {
  ExpenseThreeToNineMonths();

  ExpensesParams call(List<BillModel> allBills) {
    try {
      final oneMontAgo =
          AppConstants.currentDate.changeMonth(isAddition: false);
      final twoMonthsAgo = oneMontAgo.changeMonth(isAddition: false);
      final threeMonthsAgo = twoMonthsAgo.changeMonth(isAddition: false);
      final fourMonthsAgo = threeMonthsAgo.changeMonth(isAddition: false);
      final fiveMonthsAgo = fourMonthsAgo.changeMonth(isAddition: false);
      final sixMonthsAgo = fiveMonthsAgo.changeMonth(isAddition: false);
      final sevenMonthsAgo = sixMonthsAgo.changeMonth(isAddition: false);
      final eightMonthsAgo = sevenMonthsAgo.changeMonth(isAddition: false);
      final nineMonthsAgo = eightMonthsAgo.changeMonth(isAddition: false);

      final thisMonthPayedBills =
          allBills.where((element) => element.isMonthPayed()).toList();

      final oneMonthAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: oneMontAgo))
          .toList();

      final twoMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: twoMonthsAgo))
          .toList();

      final threeMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: threeMonthsAgo))
          .toList();

      final fourMonthsAgoMonthPayedBills = allBills
          .where((element) => element.isMonthPayed(date: fourMonthsAgo))
          .toList();

      final fiveMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: fiveMonthsAgo))
          .toList();

      final sixMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: sixMonthsAgo))
          .toList();

      final sevenMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: sevenMonthsAgo))
          .toList();

      final eightMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: eightMonthsAgo))
          .toList();

      final nineMonthsAgoPayedBills = allBills
          .where((element) => element.isMonthPayed(date: nineMonthsAgo))
          .toList();

      final threeMonthsBills = oneMonthAgoPayedBills +
          twoMonthsAgoPayedBills +
          threeMonthsAgoPayedBills;

      final sixMonthsBills = threeMonthsBills +
          fourMonthsAgoMonthPayedBills +
          fiveMonthsAgoPayedBills +
          sixMonthsAgoPayedBills;

      final nineMonthsBills = sixMonthsBills +
          sevenMonthsAgoPayedBills +
          eightMonthsAgoPayedBills +
          nineMonthsAgoPayedBills;

      return ExpensesParams(
        thisMonthExpenses: _paymentSum(thisMonthPayedBills),
        threeMonthExpenses: _paymentSum(threeMonthsBills),
        sixMonthExpenses: _paymentSum(sixMonthsBills),
        nineMonthExpenses: _paymentSum(nineMonthsBills),
      );
    } on AppError catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: ${error.message}');
      rethrow;
    } catch (error, trace) {
      Log.error(error, trace, 'Error executing $runtimeType: $error');
      throw ClientError(AppLocalizations.current.errorUnknowError);
    }
  }

  int _paymentSum(List<BillModel> bills) {
    int total = 0;
    for (var bill in bills) {
      total += bill.value;
    }
    return total;
  }
}
