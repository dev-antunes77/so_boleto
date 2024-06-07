enum DueDayOrParcelRanges {
  upToThree([0, 3]),
  fourToSeven([4, 7]),
  eightToTwelve([8, 12]),
  thirteenToEighteen([13, 18]),
  nineteenToTwenyFour([19, 24]),
  overTwentyFive([25, 1000]);

  const DueDayOrParcelRanges(this.value);

  final List<int> value;

  static List<List<int>> get dueDayOrParcelRanges {
    List<List<int>> range = [];
    for (var listRange in DueDayOrParcelRanges.values) {
      range.add(listRange.value);
    }
    return range;
  }
}
