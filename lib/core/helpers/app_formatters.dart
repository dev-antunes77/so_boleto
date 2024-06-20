import 'dart:math';

import 'package:so_boleto/core/extensions/num_extensions.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';

abstract class AppFormatters {
  static randomIdFormater() {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    const numbers = '0123456789';
    Random random = Random();
    String randomLetters = '';

    for (int i = 0; i < 22; i++) {
      String newCharactere = '';
      if (random.nextBool()) {
        newCharactere = _setRandomLetter(random, alphabet);
      } else {
        int index = random.nextInt(numbers.length);
        newCharactere = numbers[index];
      }
      randomLetters += newCharactere;
    }
    return randomLetters;
  }

  static _setRandomLetter(Random random, String alphabet) {
    int index = random.nextInt(alphabet.length);
    String letter = alphabet[index];
    if (random.nextBool()) {
      letter = letter.toUpperCase();
    }
    return letter;
  }

  static String parcelLabelFormatter(int parcels) {
    if (parcels < 2) {
      return AppLocalizations.current.formatterMonthBill;
    }
    return AppLocalizations.current.parcels;
  }

  static String parcelInfoFormatter(int parcels) {
    if (parcels < 2) {
      return AppLocalizations.current.formatterMonth;
    }
    return AppLocalizations.current.formatterParcelsTimes(parcels);
  }

  static String parcelRelationFormatter(int parcels, int payedParcels) {
    if (parcels < 2) {
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
