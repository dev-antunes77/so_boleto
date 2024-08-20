// ignore_for_file: equal_keys_in_map

abstract final class AppConstants {
  static final List<int> monthDays =
      List.generate(31, (index) => index + 1, growable: true);

// TODO change this variable for testing
  static final currentDate = DateTime.now();
  // static final currentDate =
  //     DateTime(DateTime.now().year, DateTime.december, 20);

  static List<DateTime> get pastMonths {
    return List.generate(11, (index) {
      // This excludes the current month from past month list
      return DateTime(currentDate.year, (currentDate.month - 1) - (10 - index));
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
