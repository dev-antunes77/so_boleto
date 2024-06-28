import 'package:flutter/material.dart';
import 'package:so_boleto/core/routes/routes.dart';
import 'package:so_boleto/core/theme/settings/app_theme_values.dart';
import 'package:so_boleto/presenter/profile/widgets/profile_option_tile.dart';

class ProfilePreferences extends StatelessWidget {
  const ProfilePreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppThemeValues.spaceMedium),
        child: Column(
          children: [
            ProfileOptionTile(
              label: 'Tema',
              subtitle: 'escolha entre tema claro ou escuro',
              route: Routes.profilePreferencesTheme,
            )
          ],
        ),
      ),
    );
  }
}
