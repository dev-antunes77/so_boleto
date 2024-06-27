import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

const _defaultTextStyle = TextStyle(
  fontFamily: 'AMX',
  fontSize: AppThemeValues.fontSizeMedium,
  fontWeight: AppThemeValues.fontWeightRegular,
);

const _oldStamperTextStyle = TextStyle(
  fontFamily: 'Old-Stamper',
  fontSize: AppThemeValues.fontSizeMedium,
  fontWeight: AppThemeValues.fontWeightRegular,
);

const _robotoTextStyle = TextStyle(
  fontFamily: 'roboto',
  fontSize: AppThemeValues.fontSizeMedium,
  fontWeight: AppThemeValues.fontWeightRegular,
);

extension TypographyExtension on BuildContext {
  /// Size 26, Font 500
  TextStyle get textStamper => _oldStamperTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeMedium,
        fontWeight: AppThemeValues.fontWeightBold,
      );

  /// Size 18, Font 500
  TextStyle get textRobotoSubtitleMediumToLarge => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeMediumToLarge,
        fontWeight: AppThemeValues.fontWeightMedium,
      );

  /// Size 16, Font 500
  TextStyle get textRobotoSubtitleMedium => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeMedium,
        fontWeight: AppThemeValues.fontWeightMedium,
      );

  /// Size 14, Font 500
  TextStyle get textRobotoSubtitleSmall => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeSmall,
        fontWeight: AppThemeValues.fontWeightMedium,
      );

  /// Size 12, Font 500
  TextStyle get textRobotoSubtitleXSmall => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeXSmall,
        fontWeight: AppThemeValues.fontWeightMedium,
      );

  /// Size 10, Font 500
  TextStyle get textRobotoSubtitleTiny => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeTiny,
        fontWeight: AppThemeValues.fontWeightMedium,
      );

  /// Size 18, Font 400
  TextStyle get textRobotoMediumToLarge => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeMedium,
      );

  /// Size 16, Font 400
  TextStyle get textRobotoMedium => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeSmall,
      );

  /// Size 14, Font 400
  TextStyle get textRobotoSmall => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeSmall,
      );

  /// Size 12, Font 400
  TextStyle get textRobotoXSmall => _robotoTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeXSmall,
      );

  /// Size 28, Font 800
  TextStyle get textTitleLarge => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeHuge,
        fontWeight: AppThemeValues.fontWeightBlack,
      );

  /// Size 24, Font 800
  TextStyle get textTitleMedium => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeXLarge,
        fontWeight: AppThemeValues.fontWeightBlack,
      );

  /// Size 20, Font 800
  TextStyle get textTitleSmall => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeLarge,
        fontWeight: AppThemeValues.fontWeightBlack,
      );

  /// Size 28, Font 700
  TextStyle get textSubtitleHuge => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeHuge,
        fontWeight: AppThemeValues.fontWeightBold,
      );

  /// Size 24, Font 700
  TextStyle get textSubtitleLarge => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeXLarge,
        fontWeight: AppThemeValues.fontWeightBold,
      );

  /// Size 20, Font 700
  TextStyle get textSubtitleMedium => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeLarge,
        fontWeight: AppThemeValues.fontWeightBold,
      );

  /// Size 16, Font 500
  TextStyle get textSubtitleSmall => _defaultTextStyle.copyWith(
        fontWeight: AppThemeValues.fontWeightMedium,
      );

  /// Size 20, Font 400
  TextStyle get textLarge =>
      _defaultTextStyle.copyWith(fontSize: AppThemeValues.fontSizeLarge);

  /// Size 16, Font 400
  TextStyle get textMedium => _defaultTextStyle;

  /// Size 14, Font 400
  TextStyle get textSmall =>
      _defaultTextStyle.copyWith(fontSize: AppThemeValues.fontSizeSmall);

  /// Size 12, Font 400
  TextStyle get textXSmall =>
      _defaultTextStyle.copyWith(fontSize: AppThemeValues.fontSizeXSmall);

  /// Size 10, Font 400
  TextStyle get textTiny => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeTiny,
      );

  /// Size 20, Font 400
  TextStyle get textWhiteLarge => _defaultTextStyle.copyWith(
        fontSize: AppThemeValues.fontSizeLarge,
        color: AppColors.white,
      );
}
