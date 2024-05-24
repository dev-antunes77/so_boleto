import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/utils/dialog_utils.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({
    super.key,
    required this.child,
    this.doesLeaveTheApp = false,
    this.route,
  });

  final Widget child;
  final bool doesLeaveTheApp;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => doesLeaveTheApp
          ? _leaveAppDialog(context)
          : context.navigateTo(route ?? Routes.home),
      canPop: false,
      child: child,
    );
  }

  void _leaveAppDialog(BuildContext context) => showBaseDialog(
        context: context,
        title: 'Sair do app?',
        description: 'Tem certeza que deseja sair do app?',
        onAcept: () => SystemNavigator.pop(),
      );
}
