import 'package:flutter/services.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

export 'package:flutter/services.dart';

abstract class SystemOverlayUtils {
  static const transparent = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.black,
    systemNavigationBarDividerColor: AppColors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const primary = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    statusBarColor: AppColors.primary,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.black,
    systemNavigationBarDividerColor: AppColors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const white = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    statusBarColor: AppColors.background,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.black,
    systemNavigationBarDividerColor: AppColors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
