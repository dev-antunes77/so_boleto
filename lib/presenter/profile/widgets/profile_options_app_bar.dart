import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';
import 'package:so_boleto/core/routes/routes.dart';

class ProfileOptionsAppBar extends StatelessWidget {
  const ProfileOptionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: _displayProperTitle(context.currentRoute),
      leadingBackButton: const CustomBackButton(),
    );
  }

  String _displayProperTitle(String route) {
    switch (route) {
      case Routes.profilePreferences:
        return 'Preferências';
    }
    return 'Profile';
  }
}
