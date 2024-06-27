import 'package:flutter/material.dart';
import 'package:so_boleto/core/components/buttons/back_button.dart';
import 'package:so_boleto/core/components/custom_app_bar/custom_app_bar.dart';

class ProfileOptionsAppBar extends StatelessWidget {
  const ProfileOptionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      title: 'Example',
      leadingBackButton: CustomBackButton(),
    );
  }
}
