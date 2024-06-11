import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';

abstract class AppFormatters {
  static String parcelLabelFormatter(bool dueEveryMonth, int parcels) {
    if (dueEveryMonth) {
      return AppLocalizations.current.formatterMonthBill;
    }
    return AppLocalizations.current.parcels;
  }

  static String parcelInfoFormatter(bool dueEveryMonth, int parcels) {
    if (dueEveryMonth) {
      return AppLocalizations.current.formatterMonth;
    }
    return AppLocalizations.current.formatterParcelsTimes(parcels);
  }

  static String parcelRelationFormatter(
      bool dueEveryMonth, int parcels, int payedParcels) {
    if (dueEveryMonth) {
      return AppLocalizations.current.formatterMonthBill;
    }
    return AppLocalizations.current
        .formatterPayedParcelsOfParcels(payedParcels, parcels);
  }

  static List<String> parcelRangeToString(List<List<int>> list) {
    List<String> formattedRanges = [];
    for (List<int> range in list) {
      if (range[1] == 1000) {
        formattedRanges.add(
          AppLocalizations.current.formatterParcelsMoreThan(
            range[0].toString(),
          ),
        );
      } else if (range[1] < 4) {
        formattedRanges.add(
          AppLocalizations.current.formatterParcelsOrLess(
            range[1].toString(),
          ),
        );
      } else {
        formattedRanges.add(
          AppLocalizations.current.formatterParcelsFromTo(
            range[0],
            range[1],
          ),
        );
      }
    }
    return formattedRanges;
  }

  static List<String> priceRangeToString(List<List<int>> list) {
    List<String> formattedRanges = [];
    for (List<int> range in list) {
      if (range[1] == 1000000) {
        final currency = (range[0] * 100.00).formatCurrency();
        formattedRanges.add(
          AppLocalizations.current.formatterParcelsMoreThan(
            currency,
          ),
        );
      } else if (range[1] < 101) {
        final currency = (range[1] * 100.00).formatCurrency();
        formattedRanges.add(
          AppLocalizations.current.formatterParcelsOrLess(
            currency,
          ),
        );
      } else {
        final currency = (range[0] * 100.00).formatCurrency();
        final currency2 = (range[1] * 100.00).formatCurrency();
        formattedRanges.add('$currency  -  $currency2');
      }
    }
    return formattedRanges;
  }

  static List<String> dueDayRangeToString(List<List<int>> list) {
    List<String> formattedRanges = [];
    for (List<int> range in list) {
      if (range[1] == 1000) {
        formattedRanges.add(
          AppLocalizations.current.formatterDayBefore(
            range[0],
          ),
        );
      } else if (range[1] < 4) {
        formattedRanges.add(
          AppLocalizations.current.formatterDayAfter(
            range[1],
          ),
        );
      } else {
        formattedRanges.add(
          AppLocalizations.current.formatterDayBetween(
            range[0],
            range[1],
          ),
        );
      }
    }
    return formattedRanges;
  }
}
