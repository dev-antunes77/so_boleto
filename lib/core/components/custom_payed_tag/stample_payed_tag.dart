import 'dart:math';

import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class StamplePayedTag extends StatelessWidget {
  const StamplePayedTag(this.showTag, {super.key});

  final bool showTag;

  @override
  Widget build(BuildContext context) {
    return showTag
        ? Positioned(
            top: 0,
            left: context.width * 0.55,
            child: Transform.rotate(
              angle: pi / 6.0,
              child: Transform.translate(
                offset: const Offset(-10, 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: AppColors.grey,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.current.homeBillPayedTag,
                      style: context.textStamper.copyWith(
                        color: AppColors.grey,
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
