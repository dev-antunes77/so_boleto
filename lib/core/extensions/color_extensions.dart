import 'dart:ui';

extension ColorExtensions on Color {
  Color makeColorDarker({double opacityFactor = 0.3}) {
    int red = this.red;
    int green = this.green;
    int blue = this.blue;
    int alpha = (this.alpha * opacityFactor).round();
    return Color.fromARGB(alpha, red, green, blue);
  }

  String toHexColor() => '#${value.toRadixString(16).substring(2)}';

  String colorToJson() =>
      '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}
