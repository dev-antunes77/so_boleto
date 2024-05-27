import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/utils/system_overlay_utils.dart';

abstract class AppDialogs {
  static void leaveBillCreation(BuildContext context) => context.showDialog(
        title: 'Tem certeza?',
        description: 'Se sair,\na criação dessa conta será perdida.',
        onAcept: () => context.navigateTo(Routes.home),
      );

  static void leaveApp(BuildContext context) => context.showDialog(
        title: 'Sair do app?',
        description: 'Tem certeza que deseja\nsair do app?',
        onAcept: () => SystemNavigator.pop(),
      );
}
