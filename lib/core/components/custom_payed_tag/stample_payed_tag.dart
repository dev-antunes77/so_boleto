import 'dart:math';

import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

class StamplePayedTag extends StatelessWidget {
  const StamplePayedTag(this.showTag, {super.key, required this.color});

  final bool showTag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return showTag
        ? Positioned(
            top: AppThemeValues.spaceXXXSmall,
            left: context.width * 0.65,
            child: Transform.rotate(
              angle: pi / 6.0,
              child: Transform.translate(
                offset: const Offset(-10, 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppThemeValues.spaceSmall),
                    ),
                    border: Border.all(
                      color: color,
                      width: AppThemeValues.spaceXTiny,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppThemeValues.spaceXXXSmall),
                    child: Text(
                      AppLocalizations.current.payedTag,
                      style: context.textStamper.copyWith(
                        color: color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
