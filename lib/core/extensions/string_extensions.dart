import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_sorting.dart';
import 'package:so_boleto/domain/models/enums/bill_status.dart';
import 'package:so_boleto/domain/models/enums/payed_tag.dart';

extension StringExtensions on String {
  BillCategory categoryToEnum() =>
      BillCategory.values.firstWhere((element) => element.value == this);

  BillStatus billStatuToEnum() =>
      BillStatus.values.firstWhere((element) => element.value == this);

  PayedTag payedTagToEnum() =>
      PayedTag.values.firstWhere((element) => element.value == this);

  BillSorting billSortingToEnum() =>
      BillSorting.values.firstWhere((element) => element.kind == this);

  String capitalize() =>
      isNotEmpty ? this[0].toUpperCase() + substring(1) : this;

  int revertCurrencyFormat() {
    RegExp regex = RegExp(r'[^0-9]');
    String result = replaceAll(regex, '');
    if (result.isEmpty) return 0;
    return int.parse(result);
  }

  DateTime stringToDateTime() => DateFormat.yMd().add_jms().parse(this);

  String encodePassword() => base64.encode(utf8.encode(this));

  String decodePassword() => utf8.decode(base64.decode(this));

  String breakLongStrings({required int length, required int desiredLength}) =>
      length > desiredLength ? "${substring(0, desiredLength)}..." : this;

  Color colorFromJson() {
    String hexColor = replaceAll('#', '');
    int intValue = int.parse(hexColor, radix: 16);
    int alpha = (intValue >> 24) & 0xFF;
    int red = (intValue >> 16) & 0xFF;
    int green = (intValue >> 8) & 0xFF;
    int blue = intValue & 0xFF;
    return Color.fromARGB(alpha, red, green, blue);
  }

  String removeDiacritics() => split('')
      .map((char) => AppConstants.diacriticsMap[char.toUpperCase()] ?? char)
      .join('');
}
