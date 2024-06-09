import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';

extension StringExtensions on String {
  BillCategory categoryToEnum() => BillCategory.values
      .firstWhere((element) => element.value['text'] == this);

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
}
