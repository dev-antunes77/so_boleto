import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';

PreferredSizeWidget customAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  bool hasBackButton = false,
  String route = Routes.home,
}) =>
    PreferredSize(
      preferredSize: const Size(double.infinity, 40),
      child: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
        leading: hasBackButton
            ? IconButton(
                onPressed: () => context.navigateTo(route),
                icon: const Icon(Icons.arrow_back),
              )
            : const SizedBox.shrink(),
      ),
    );
