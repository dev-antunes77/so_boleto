import 'package:so_boleto/domain/models/enums/category.dart';

extension StringExtensions on String {
  String replaceCharAt(String newChar, int position) {
    if (position < 0 || position >= length) {
      throw ArgumentError('Position outside string boundaries');
    }

    final List<String> characters = split('');
    characters[position] = newChar;

    return characters.join();
  }

  Category textToEnum() => categoryMap.entries
      .firstWhere((element) => element.value['string'] == this)
      .key;

  String capitalize() =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : this;
}
