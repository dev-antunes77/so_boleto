abstract final class AppConstants {
  static final List<int> monthDays =
      List.generate(31, (index) => index + 1, growable: true);

  static final List<int> parcelsLength =
      List.generate(60, (index) => index + 1, growable: true);

  static const defaultColorHex = '#04873a';
}
