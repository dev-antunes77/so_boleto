enum PriceRanges {
  upToHundred([0, 100]),
  oneToThreeHundred([100, 300]),
  threeToFiveHundred([300, 500]),
  fiveToTenHundred([500, 1000]),
  tenToTwentyFiveHundred([1000, 2500]),
  twentyFiveToFiftyHundred([2500, 5000]),
  fiveToTenThousand([5000, 10000]),
  overTenThousand([10000, 1000000]);

  const PriceRanges(this.value);

  final List<int> value;

  static List<List<int>> get priceRanges {
    List<List<int>> prices = [];
    for (var priceRange in PriceRanges.values) {
      prices.add(priceRange.value);
    }
    return prices;
  }
}
