import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/size_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';

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
            left: 0,
            top: 10,
            bottom: 10,
            child: Transform.translate(
              offset: const Offset(-AppThemeValues.spaceSmall, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: color,
                ),
                height: 60,
                width: context.width * 0.03,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
