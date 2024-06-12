enum PageTransitions {
  transitionFade('transitionFade'),
  transitionRotation('transitionRotation'),
  transitionScale('transitionScale'),
  transitionSlide('transitionSlide'),
  transitionMatrix('transitionMatrix');

  const PageTransitions(this.value);
  final String value;

  String toJson() => value;
}
