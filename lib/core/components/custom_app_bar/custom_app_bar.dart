import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leadingBackButton,
    this.route,
  });

  final String title;
  final List<Widget>? actions;
  final Widget? leadingBackButton;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBackground,
      elevation: 12,
      title: Align(alignment: Alignment.centerLeft, child: Text(title)),
      titleTextStyle: context.textRobotoSubtitleMedium,
      actions: actions,
      leading: leadingBackButton,
    );
  }
}
