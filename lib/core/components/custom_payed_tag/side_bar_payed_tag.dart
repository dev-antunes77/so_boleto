import 'package:flutter/material.dart';
import 'package:so_boleto/core/l10n/generated/l10n.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class SideBarPayedTag extends StatelessWidget {
  const SideBarPayedTag({
    super.key,
    required this.showTag,
    required this.color,
  });

  final bool showTag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return showTag
        ? Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: color,
              ),
              width: context.width * 0.06,
              child: Align(
                alignment: Alignment.centerRight,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      children: AppLocalizations.current.payedTag
                          .split('')
                          .map(
                            (letter) => Text(
                              letter,
                              style: context.textRobotoSmall.copyWith(
                                decorationStyle: TextDecorationStyle.dashed,
                                color: AppColors.white,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
