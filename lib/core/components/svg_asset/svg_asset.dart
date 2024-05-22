import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    super.key,
    required this.svg,
    this.height,
    this.width,
    this.color,
  });
  final String svg;
  final Color? color;

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svg,
      height: height,
      width: width,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcATop) : null,
    );
  }
}
