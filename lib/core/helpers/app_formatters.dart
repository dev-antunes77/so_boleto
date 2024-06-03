import 'package:so_boleto/core/extensions/num_extensions.dart';

abstract class AppFormatters {
  static String parcelLabelFormatter(bool dueEveryMonth, int parcels) {
    if (dueEveryMonth) {
      return 'Conta mensal';
    } else if (parcels > 1) {
      return 'Parcelas';
    }
    return 'Conta única';
  }

  static String parcelInfoFormatter(bool dueEveryMonth, int parcels) {
    if (dueEveryMonth) {
      return 'Mensal';
    } else if (parcels > 1) {
      return '$parcels vezes';
    }
    return '1 vez';
  }

  static String parcelRelationFormatter(
      bool dueEveryMonth, int parcels, int payedParcels) {
    if (dueEveryMonth) {
      return 'Mensal';
    } else if (parcels > 1) {
      return '$payedParcels de $parcels';
    }
    return 'Conta única';
  }

  static List<String> parcelRangeToString(List<List<int>> list) {
    List<String> formattedRanges = [];
    for (List<int> range in list) {
      if (range[1] == 1000) {
        formattedRanges.add('mais de ${range[0]}');
      } else if (range[1] < 4) {
        formattedRanges.add('${range[1]} ou menos');
      } else {
        formattedRanges.add('de ${range[0]} a ${range[1]}');
      }
    }
    return formattedRanges;
  }

  static List<String> priceRangeToString(List<List<int>> list) {
    List<String> formattedRanges = [];
    for (List<int> range in list) {
      if (range[1] == 1000000) {
        final currency = (range[0] * 100.00).formatCurrency();
        formattedRanges.add('mais de $currency');
      } else if (range[1] < 101) {
        final currency = (range[1] * 100.00).formatCurrency();
        formattedRanges.add('$currency ou menos');
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
        formattedRanges.add('depois do dia ${range[0]}');
      } else if (range[1] < 4) {
        formattedRanges.add('antes do dia ${range[1]}');
      } else {
        formattedRanges.add('entre os dias ${range[0]} e ${range[1]}');
      }
    }
    return formattedRanges;
  }
}
