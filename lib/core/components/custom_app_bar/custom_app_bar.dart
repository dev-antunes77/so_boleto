import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leadingBackButton,
    this.centerTitle = false,
  }) : assert(title != null || titleWidget != null);

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leadingBackButton;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 12,
      title: title != null
          ? Text(
              title!,
              style: context.textRobotoSubtitleMediumToLarge,
            )
          : const SizedBox.shrink(),
      centerTitle: centerTitle,
      flexibleSpace: titleWidget,
      actions: actions,
      leading: leadingBackButton,
    );
  }
}
