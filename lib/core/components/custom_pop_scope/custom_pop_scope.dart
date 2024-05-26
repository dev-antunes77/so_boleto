import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/utils/dialog_utils.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({
    super.key,
    required this.child,
    this.leaveTheApp = false,
    this.leaveBillCreation = false,
    this.route,
  });

  final Widget child;
  final bool leaveTheApp;
  final bool leaveBillCreation;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => leaveTheApp
          ? _leaveAppDialog(context)
          : leaveBillCreation
              ? _leaveBillCreationDialog(context)
              : context.navigateTo(route ?? Routes.home),
      canPop: false,
      child: child,
    );
  }

  void _leaveAppDialog(BuildContext context) => showBaseDialog(
        context: context,
        title: 'Sair do app?',
        description: 'Tem certeza que deseja\nsair do app?',
        onAcept: () => SystemNavigator.pop(),
      );

  void _leaveBillCreationDialog(BuildContext context) => showBaseDialog(
        context: context,
        title: 'Tem certeza?',
        description: 'Se sair,\na criação dessa conta será perdida.',
        onAcept: () => context.navigateTo(Routes.home),
      );
}
