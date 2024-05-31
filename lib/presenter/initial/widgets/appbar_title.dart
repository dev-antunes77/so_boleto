import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/extensions/typography_extensions.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(this.route, {super.key});
  final String route;

  @override
  Widget build(BuildContext context) {
    String title = 'Suas contas';
    if (route == Routes.expenses) {
      title = 'Seus gastos';
    } else if (route == Routes.profile) {
      title = 'Preferências';
    } else if (route == Routes.filter) {
      title = 'Filtros';
    }
    return Text(
      title,
      style: context.textRobotoSubtitleMediumToLarge,
    );
  }
}
