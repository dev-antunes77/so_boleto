import 'dart:io';

import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

extension SizeExtension on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);

  double get width => _mediaQuery.size.width;

  double get height => _mediaQuery.size.height;

  double get appBarHeight => _mediaQuery.padding.top + kToolbarHeight;

  double get heightWithoutBottomBar => height - bottomBarHeight;

  /// App Navigation Bar Height
  double get bottomBarHeight =>
      kBottomNavigationBarHeight +
      _osNavigationBarHeight +
      AppThemeValues.playerHeight;

  double get _osNavigationBarHeight => _mediaQuery.padding.bottom;

  /// App Navigation Bar Height without Player
  double get bottomBarWithoutPlayerHeight =>
      Platform.isAndroid ? bottomBarHeight : _bottomBarWithoutPlayerHeight - 28;

  double get _bottomBarWithoutPlayerHeight =>
      kBottomNavigationBarHeight + _osNavigationBarHeight;
}
