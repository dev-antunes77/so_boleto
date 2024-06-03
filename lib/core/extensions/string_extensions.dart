import 'package:so_boleto/domain/models/enums/bill_category.dart';
import 'package:so_boleto/domain/models/enums/bill_state.dart';

extension StringExtensions on String {
  String replaceCharAt(String newChar, int position) {
    if (position < 0 || position >= length) {
      throw ArgumentError('Position outside string boundaries');
    }

    final List<String> characters = split('');
    characters[position] = newChar;

    return characters.join();
  }

  BillCategory categoryToEnum() => BillCategory.values
      .firstWhere((element) => element.value['text'] == this);

  BillStatus billStatuToEnum() =>
      BillStatus.values.firstWhere((element) => element.value == this);

  String capitalize() =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : this;
}
