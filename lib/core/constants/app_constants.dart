abstract final class AppConstants {
  static final List<int> monthDays =
      List.generate(31, (index) => index + 1, growable: true);

  static final List<int> parcelsLength =
      List.generate(60, (index) => index + 1, growable: true);

  // static final List<List<int>> parcelOrDueDayRanges = [
  //   [0, 3],
  //   [4, 7],
  //   [8, 12],
  //   [13, 18],
  //   [19, 24],
  //   [25, 1000],
  // ];

  // static final List<List<int>> priceRanges = [
  //   [0, 100],
  //   [100, 300],
  //   [300, 500],
  //   [500, 1000],
  //   [1000, 2500],
  //   [2500, 5000],
  //   [5000, 10000],
  //   [10000, 1000000],
  // ];
}
