import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';

extension StringExtensions on String {
  BillCategory categoryToEnum() =>
      BillCategory.values.firstWhere((element) => element.value == this);

  BillStatus billStatuToEnum() =>
      BillStatus.values.firstWhere((element) => element.value == this);

  String capitalize() =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : this;

  int revertCurrencyFormat() {
    RegExp regex = RegExp(r'[^0-9]');
    String result = replaceAll(regex, '');
    if (result.isEmpty) return 0;
    return int.parse(result);
  }

  DateTime stringToDateTime() => DateFormat.yMd().add_jms().parse(this);

  String encodePassword() => base64.encode(utf8.encode(this));

  String decodePassword() => utf8.decode(base64.decode(this));
}
