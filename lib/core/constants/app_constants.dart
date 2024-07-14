// ignore_for_file: equal_keys_in_map

abstract final class AppConstants {
  static final List<int> monthDays =
      List.generate(31, (index) => index + 1, growable: true);

  static List<DateTime> get months {
    return List.generate(12, (index) {
      final currentDate = DateTime.now();
      return DateTime(currentDate.year, currentDate.month - (11 - index));
    });
  }

  static final List<int> parcelsLength =
      List.generate(60, (index) => index + 1, growable: true);

  static const defaultColorHex = '#04873a';

  static const Map<String, String> diacriticsMap = {
    'Á': 'A',
    'À': 'A',
    'Â': 'A',
    'Ä': 'A',
    'Å': 'A',
    'Ç': 'C',
    'É': 'E',
    'È': 'E',
    'Ê': 'E',
    'Ë': 'E',
    'Í': 'I',
    'Ì': 'I',
    'Î': 'I',
    'Ï': 'I',
    'Ñ': 'N',
    'Ó': 'O',
    'Ò': 'O',
    'Ô': 'O',
    'Ö': 'O',
    'Ù': 'U',
    'Ú': 'U',
    'Û': 'U',
    'Ü': 'U',
    'Ý': 'Y',
  };
}
