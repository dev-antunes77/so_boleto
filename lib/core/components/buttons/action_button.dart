import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/cubit/theme_cubit.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    this.height,
    required this.onTap,
  });

  final String icon;
  final double? height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeValues.spaceXSmall,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SvgAsset(
          svg: icon,
          color: context.watch<ThemeCubit>().state.selectedColors.icon,
          height: height ?? 24,
        ),
      ),
    );
  }
}
