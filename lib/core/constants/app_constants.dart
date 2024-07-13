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
}
