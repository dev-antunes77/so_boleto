import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_colors.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  Widget? leadingBackButton,
  String route = Routes.home,
}) =>
    PreferredSize(
      preferredSize: const Size(double.infinity, 40),
      child: AppBar(
        backgroundColor: AppColors.primaryBackground,
        elevation: 12,
        title: Text(title),
        centerTitle: true,
        actions: actions,
        leading: leadingBackButton,
      ),
    );
