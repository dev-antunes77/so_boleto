import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/dialogs/app_dialogs.dart';
import 'package:so_boleto/core/routes/routes.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({
    super.key,
    required this.child,
    this.leaveTheApp = false,
    this.leaveBillCreation = false,
    this.canPop = false,
    this.route,
  });

  final Widget child;
  final bool leaveTheApp;
  final bool leaveBillCreation;
  final bool canPop;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => leaveTheApp
          ? AppDialogs.leaveApp(context)
          : leaveBillCreation
              ? AppDialogs.leaveBillCreation(context)
              : context.navigateTo(route ?? Routes.home),
      canPop: canPop,
      child: child,
    );
  }
}
