import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:so_boleto/core/constants/app_constants.dart';
import 'package:so_boleto/core/extensions/color_extensions.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    super.key,
    required this.svg,
    this.height,
    this.width,
    this.isMulticolor = false,
    this.color,
  });
  final String svg;
  final Color? color;
  final double? height;
  final double? width;
  final bool isMulticolor;

  @override
  Widget build(BuildContext context) {
    final iconColor =
        color ?? context.read<ThemeCubit>().state.selectedColors.baseColor;
    return isMulticolor
        ? FutureBuilder<String>(
            future: DefaultAssetBundle.of(context).loadString(svg),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String modifiedSvgContent = snapshot.data!;
                if (iconColor != AppColors.primary) {
                  modifiedSvgContent = snapshot.data!
                      .replaceAll(
                          AppConstants.defaultColorHex, iconColor.toHexColor())
                      .replaceAll(AppConstants.defaultColorHex, 'themeColor');
                }
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
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcATop),
          );
  }
}
