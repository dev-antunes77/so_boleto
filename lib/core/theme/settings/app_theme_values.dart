import 'package:flutter/material.dart';

abstract class AppThemeValues {
  //Radius
  static const borderRadiusTinyRadius = 4.0;
  static const borderRadiusSmallRadius = 12.0;
  static const borderRadiusCircleRadius = 50.0;
  static const borderRadiusTiny = Radius.circular(borderRadiusTinyRadius);
  static const borderRadiusSmall = Radius.circular(borderRadiusSmallRadius);
  static const borderRadiusCircle = Radius.circular(borderRadiusCircleRadius);

  //Fonts
  static const fontSizeTiny = 10.0;
  static const fontSizeXSmall = 12.0;
  static const fontSizeSmall = 14.0;
  static const fontSizeMedium = 16.0;
  static const fontSizeLarge = 20.0;
  static const fontSizeXLarge = 24.0;
  static const fontSizeHuge = 28.0;

  static const fontWeightLight = FontWeight.w300;
  static const fontWeightRegular = FontWeight.w400;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightBold = FontWeight.w700;
  static const fontWeightBlack = FontWeight.w800;

  //Sizes
  static const playerHeight = 54.0;
  static const radioCardLabelHeight = 38.0;

  static const emptyWidget = SizedBox.shrink();

  static const defaultIconSize = Size(24.0, 24.0);

  ///2px
  static const spaceXTiny = 2.0;

  ///4px
  static const spaceTiny = 4.0;

  ///8px
  static const spaceXXSmall = 8.0;

  ///10px
  static const spaceXSmall = 10.0;

  ///12px
  static const spaceSmall = 12.0;

  ///16px
  static const spaceMedium = 16.0;

  ///20px
  static const spaceLarge = 20.0;

  ///24px
  static const spaceXLarge = 24.0;

  ///28px
  static const spaceHuge = 28.0;

  ///48px
  static const spaceImense = 48.0;

  ///54px
  static const spaceEnormous = 54.0;

  ///70px
  static const spaceTitanic = 70.0;

  ///90px
  static const spaceColossal = 90.0;

  // Vertical space

  ///2px
  static const spaceVerticalXTiny = SizedBox(height: spaceXTiny);

  ///4px
  static const spaceVerticalTiny = SizedBox(height: spaceTiny);

  ///8px
  static const spaceVerticalXXSmall = SizedBox(height: spaceXXSmall);

  ///10px
  static const spaceVerticalXSmall = SizedBox(height: spaceXSmall);

  ///12px
  static const spaceVerticalSmall = SizedBox(height: spaceSmall);

  ///16px
  static const spaceVerticalMedium = SizedBox(height: spaceMedium);

  ///20px
  static const spaceVerticalLarge = SizedBox(height: spaceLarge);

  ///24px
  static const spaceVerticalXLarge = SizedBox(height: spaceXLarge);

  ///28px
  static const spaceVerticalHuge = SizedBox(height: spaceHuge);

  ///48px
  static const spaceVerticalImense = SizedBox(height: spaceImense);

  ///54px
  static const spaceVerticalEnormous = SizedBox(height: spaceEnormous);

  ///70px
  static const spaceVerticalTitanic = SizedBox(height: spaceTitanic);

  ///90px
  static const spaceVerticalColossal = SizedBox(height: spaceColossal);

  // Horizontal space

  ///2px
  static const spaceHorizontalXTiny = SizedBox(width: spaceXTiny);

  ///4px
  static const spaceHorizontalTiny = SizedBox(width: spaceTiny);

  ///8px
  static const spaceHorizontalXXSmall = SizedBox(width: spaceXXSmall);

  ///10px
  static const spaceHorizontalXSmall = SizedBox(width: spaceXSmall);

  ///12px
  static const spaceHorizontalSmall = SizedBox(width: spaceSmall);

  ///16px
  static const spaceHorizontalMedium = SizedBox(width: spaceMedium);

  ///20px
  static const spaceHorizontalLarge = SizedBox(width: spaceLarge);

  ///24px
  static const spaceHorizontalXLarge = SizedBox(width: spaceXLarge);

  ///28px
  static const spaceHorizontalHuge = SizedBox(width: spaceHuge);

  ///48px
  static const spaceHorizontalImense = SizedBox(width: spaceImense);
}
