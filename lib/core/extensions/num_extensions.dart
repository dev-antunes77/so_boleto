extension IntExtensions on int {
  String addLeadingZero() {
    if (this <= -10 && this >= 10) {
      return toString();
    }
    return toString().padLeft(2, '0');
  }
}
