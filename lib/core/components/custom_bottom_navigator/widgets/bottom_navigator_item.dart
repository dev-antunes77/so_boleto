import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/svg_asset/svg_asset.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

BottomNavigationBarItem buildBottomNavigationBarItem(
  String text,
  String icon,
) =>
    BottomNavigationBarItem(
      label: text,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: AppThemeValues.spaceTiny),
        child: SvgAsset(svg: icon),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: AppThemeValues.spaceTiny),
        child: SvgAsset(
          svg: icon,
          color: AppColors.primary,
        ),
      ),
    );
