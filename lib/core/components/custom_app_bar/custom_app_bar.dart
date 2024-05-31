import 'package:flutter/material.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leadingBackButton,
    this.route,
  });

  final Widget title;
  final List<Widget>? actions;
  final Widget? leadingBackButton;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBackground,
      elevation: 12,
      title: title,
      actions: actions,
      leading: leadingBackButton,
    );
  }
}
