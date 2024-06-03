import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

abstract class ThemeSettings {
  static ThemeData light() {
    final colors = _getColorScheme(Brightness.light);

    return ThemeData.light().copyWith(
      colorScheme: colors,
      cardTheme: _cardTheme(colors),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colors),
      bottomSheetTheme: _bottomSheetTheme(colors),
      floatingActionButtonTheme: _floatingActionButtonTheme(colors),
      dividerTheme: _dividerTheme(),
      inputDecorationTheme: _inputDecorationTheme(colors),
      dialogTheme: _dialogTheme(colors),
      scaffoldBackgroundColor: colors.surface,
    );
  }

  static ThemeData dark() {
    final colors = _getColorScheme(Brightness.dark);

    return ThemeData.dark().copyWith(
      colorScheme: colors,
      cardTheme: _cardTheme(colors),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colors),
      bottomSheetTheme: _bottomSheetTheme(colors),
      floatingActionButtonTheme: _floatingActionButtonTheme(colors),
      dividerTheme: _dividerTheme(),
      inputDecorationTheme: _inputDecorationTheme(colors),
      scaffoldBackgroundColor: colors.surface,
    );
  }

  static ColorScheme _getColorScheme(Brightness brightness) =>
      ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
        onSurface: AppColors.text,
        error: AppColors.error,
      );

  static CardTheme _cardTheme(ColorScheme colors) => CardTheme(
        elevation: 3,
        color: colors.surface,
        surfaceTintColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppThemeValues.borderRadiusTinyRadius),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(
          ColorScheme colors) =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surface,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      );

  static BottomSheetThemeData _bottomSheetTheme(ColorScheme colors) =>
      BottomSheetThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: AppThemeValues.borderRadiusSmall,
          ),
        ),
      );

  static FloatingActionButtonThemeData _floatingActionButtonTheme(
          ColorScheme colors) =>
      FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: colors.primary,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppThemeValues.borderRadiusCircleRadius,
          ),
        ),
      );

  static DividerThemeData _dividerTheme() => const DividerThemeData(
        thickness: 0,
        color: AppColors.white,
        space: 0,
      );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colors) =>
      InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppThemeValues.spaceXSmall,
          horizontal: AppThemeValues.spaceMedium,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.onSurface),
          borderRadius:
              BorderRadius.circular(AppThemeValues.borderRadiusSmallRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.onSurface),
          borderRadius:
              BorderRadius.circular(AppThemeValues.borderRadiusSmallRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.onSurface),
          borderRadius:
              BorderRadius.circular(AppThemeValues.borderRadiusSmallRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.error),
          borderRadius:
              BorderRadius.circular(AppThemeValues.borderRadiusSmallRadius),
        ),
      );

  static DialogTheme _dialogTheme(ColorScheme colors) => DialogTheme(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.surface,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppThemeValues.borderRadiusSmallRadius),
        ),
        shadowColor: AppColors.shadow,
      );
}
