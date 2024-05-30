extension EnumExtensions on Enum {
  // String categoryToText() => categoryMap.entries
  //     .firstWhere((element) => element.key == this)
  //     .value['string'];

  // String billStatusToText() => billStatusMap.entries
  //     .firstWhere((element) => element.key == this)
  //     .value['string'];

  String enumToText(Map map) =>
      map.entries.firstWhere((element) => element.key == this).value['string'];

  String enumToIcon(Map map) =>
      map.entries.firstWhere((element) => element.key == this).value['icon'];
}
