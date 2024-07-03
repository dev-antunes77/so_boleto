import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';

class CustomMenuItemButton extends StatelessWidget {
  const CustomMenuItemButton({
    super.key,
    required this.svg,
    required this.label,
    this.height,
    required this.onPressed,
  });

  final String svg;
  final String label;
  final double? height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeColors = context.read<ThemeCubit>().state.selectedColors;

    return MenuItemButton(
      leadingIcon: SvgAsset(
        svg: svg,
        height: height ?? 22,
        color: themeColors.text,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textRobotoSmall,
      ),
    );
  }
}
