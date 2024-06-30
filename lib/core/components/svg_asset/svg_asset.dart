import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/color_extensions.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    super.key,
    required this.svg,
    this.height,
    this.width,
    this.color,
    this.isMulticolor = false,
  });
  final String svg;
  final Color? color;
  final double? height;
  final double? width;
  final bool isMulticolor;

  @override
  Widget build(BuildContext context) {
    return isMulticolor
        ? FutureBuilder<String>(
            future: DefaultAssetBundle.of(context).loadString(svg),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final String modifiedSvgContent = snapshot.data!
                    .replaceAll(
                        AppConstants.defaultColorHex, color!.toHexColor())
                    .replaceAll(AppConstants.defaultColorHex, 'themeColor');
                return SvgPicture.string(
                  modifiedSvgContent,
                  height: height,
                  width: width,
                );
              }
              return const SizedBox.shrink();
            },
          )
        : SvgPicture.asset(
            svg,
            height: height,
            width: width,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcATop)
                : null,
          );
  }
}
