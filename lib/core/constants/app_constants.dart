abstract final class AppConstants {
  static final List<int> monthDays =
      List.generate(31, (index) => index + 1, growable: true);

  static final List<int> parcelsLength =
      List.generate(60, (index) => index + 1, growable: true);

  static const transitionFade = 'fade';
  static const transitionRotation = 'rotation';
  static const transitionScale = 'scale';
  static const transitionSlide = 'slide';
  static const transitionMatrix = 'matrix';
}
