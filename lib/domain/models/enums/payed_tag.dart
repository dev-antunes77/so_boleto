enum PayedTag {
  stample('stample'),
  check('check'),
  sideBar('sideBar'),
  bottomBar('bottomBar');

  const PayedTag(this.value);
  final String value;

  bool get isStample => this == PayedTag.stample;
  bool get ischeck => this == PayedTag.check;
  bool get isSideBar => this == PayedTag.sideBar;
  bool get isBottomBar => this == PayedTag.bottomBar;
}
